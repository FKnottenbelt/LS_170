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

get "/" do
  "OMG, hello Ruby Monstas!"
end

get "/signup" do
  "Here you can sign up for the next beginners course."
end

post "/signin" do
  # do something to sign in the user
end

# form data will be available in the params hash.
get "/monstas" do
  @name = params["name"]
  store_name('names.txt', @name)
  @names = read_names

  erb :monstas_08
end



# run this by simply doing $  ruby monstas_08_erb.rb