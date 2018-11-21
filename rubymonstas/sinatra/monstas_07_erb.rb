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

# form data will be available in the params hash.
get "/monstas" do
  p params  # {"name"=>"lisa"} when inputing lisa in form

  @name = params["name"]
  erb :monstas_07
end



# run this by simply doing $  ruby monstas_07_erb.rb