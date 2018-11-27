require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @users = YAML.load_file "users.yaml"
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/:name" do
  @name = params[:name]
  erb :user_page
end