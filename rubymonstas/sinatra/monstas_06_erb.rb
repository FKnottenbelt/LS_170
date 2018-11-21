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


get "/monstas" do
  erb :monstas_06
end



# run this by simply doing $  ruby monstas_06_erb.rb