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

def valid_name?(name)
  !(name.to_s.empty?  || @members.include?(name) ||
    @members.include?(name + "\n"))
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

  if valid_name?(@new_member)
    file = File.join(data_path, 'members.txt')
    File.write(file, "\n#{@new_member}", mode:'a')
    session[:message] = "Added #{@new_member}"
    status 204
    redirect "/members/#{@new_member}"
  else
    session[:message] = 'Invalid name'
    erb :new
  end

end

# Show: show individual member
get '/members/:name' do
  @name = params[:name]
  erb :show
end

# Edit: get member edit page
get '/members/:name/edit' do
  @member = params[:name]
  erb :edit
end

# Update: edit a member
put '/members/:old_name' do
  if valid_name?(params[:name])
    session[:message] = "Noted new name: #{params[:name]}"
    redirect "/members/#{params[:old_name]}"
  else
    session[:message] = 'Invalid name'
    @member = params[:old_name]
    erb :edit
  end
end