require "sinatra"
require "erb"

get "/" do    # route / request handler
  "OMG, hello Ruby Monstas!"
end

get "/signup" do
  "Here you can sign up for the next beginners course."
end

post "/signin" do
  # do something to sign in the user
end


get "/monstas/:name" do
# So far we’ve passed data to our templates using the :locals option
# key which holds a hash.
# Sinatra supports a second way of passing data, which uses instance
# variables. This is also the “Rails way” of passing data to your
# templates (views). @name in template and in router have to match
  @name = params["name"]
  erb :monstas_05
end



# run this by simply doing $  ruby monstas_05_erb.rb