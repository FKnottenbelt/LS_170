require 'sinatra'
require 'tilt/erubis'
require 'sinatra/reloader'
require 'fileutils'
require 'bundler/setup'
require 'pry'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, escape_html: true
end

before do
  @members ||= load_members
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def load_members
  members_file = File.join(data_path, 'members.txt')
  File.readlines(members_file)
end

# Index: Display all members
get '/' do
  erb :index
end

get '/members' do
  redirect '/'
end

# New: go to new member page
get '/members/new' do
  erb :new
end

# New: add new member
post '/members' do
  @new_member = params[:name]

  if @new_member.to_s.empty?  || @members.include?(@new_member) ||
      @members.include?(@new_member + "\n")
    session[:message] = 'Invalid name'
    erb :new
  else
    file = File.join(data_path, 'members.txt')
    File.write(file, "\n#{@new_member}", mode:'a')
    session[:message] = "Added #{@new_member}"
    status 204
    redirect "/members/#{@new_member}"
  end

end

# Show: show individual member
get '/members/:name' do
  @name = params[:name]
  erb :show
end

