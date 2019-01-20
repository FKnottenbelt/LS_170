require 'sinatra'
require 'tilt/erubis'
require 'sinatra/reloader'
require 'fileutils'
require 'bundler/setup'

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
  @members = load_members

  erb :index
end

# Show: show individual member
get '/members/:name' do
  @name = params[:name]
  erb :show
end