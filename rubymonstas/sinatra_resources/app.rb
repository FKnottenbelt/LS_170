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

def write_to_members_file(new_content)
  members_file = File.join(data_path, 'members.txt')
  File.write(members_file, new_content, mode: 'w')
end

def valid_name?(name)
  !(name.to_s.empty?  || @members.include?(name) ||
    @members.include?(name + "\n"))
end

def determine_name(old_name, new_name)
  if name =~ /#{old_name}/
    name.gsub(old_name, new_name).strip
  else
    name
  end
end

def edit_member(old_name, new_name)
  members = load_members

  new_content = members.map do |name|
    if name =~ /#{old_name}/
      name.gsub(old_name, new_name).strip
    else
      name
    end
  end.join

  write_to_members_file(new_content)
end

def delete_member(name)
  edit_member(name, "")
end

def add_member(name)
  file = File.join(data_path, 'members.txt')
  File.write(file, "\n#{name}", mode:'a')
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

# Create: add new member
post '/members' do
  @new_member = params[:name]

  if valid_name?(@new_member)
    add_member(@new_member)
    session[:message] = "Added #{@new_member}"

    redirect "/members/#{@new_member}"
  else
    status 422
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
    @name = params[:name]
    edit_member(params[:old_name], @name)
    session[:message] = "Changed name to: #{@name}"

    redirect "/members/#{@name}"
  else
    status 422
    session[:message] = 'Invalid name'
    @member = params[:old_name]

    erb :edit
  end
end

# Delete: get page to delete member
get '/members/:name/delete' do
  @member = params[:name]
  erb :delete
end

# Destroy: delete member
delete '/members/:name' do
  delete_member(params[:name])
  redirect "/members"
end