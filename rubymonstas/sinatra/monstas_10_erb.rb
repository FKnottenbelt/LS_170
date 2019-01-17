require "sinatra"
require "erb"

def store_name(filename, name)
  File.open(filename, 'a+') do |file|
    file.puts(name)
  end
end

def read_names
  return [] unless File.exists?('names.txt')
  File.readlines('names.txt')
end

enable :sessions

get "/" do
  "OMG, hello Ruby Monstas!"
end

get "/signup" do
  "Here you can sign up for the next beginners course."
end

post "/signin" do
  # do something to sign in the user
end

get "/monstas" do
  @name = params["name"]
  @names = read_names
  @message = session.delete(:message)

  erb :monstas_10
end

post "/monstas" do
  @name = params["name"]

  if @name.to_s.empty?
    session[:message] = "You need to enter a name."
  elsif read_names.include?(@name)
    session[:message] = "#{@name} is already included in our list."
  else
    store_name("names.txt", @name)
    session[:message] = "Successfully stored the name #{@name}."
  end

  redirect "/monstas?name=#{@name}"
end


