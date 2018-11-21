require "sinatra"

get "/" do    # route / request handler
  "OMG, hello Ruby Monstas!"
end

get "/signup" do
  "Here you can sign up for the next beginners course."
end

post "/signin" do
  # do something to sign in the user
end

# params is a hash that Sinatra makes available for you in your route blocks.
# Sinatra adds matches from the path pattern to the params hash.
get "/monstas/:name" do

  #"Hello #{params["name"]}!"
  params.inspect  # {"name"=>"femke"}
end

# run this by simply doing $ ruby monstas.rb