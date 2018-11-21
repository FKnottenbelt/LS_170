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

# In order to use ERB we need to require it, define an ERB template,
# and make any variables used in the template known as local variables
# in our route:
get "/monstas/:name" do
  #ERB.new("<h1>Hello <%= params[:name] %></h1>").result(binding)

  # If we specify a key :locals and give it another hash, then Sinatra will make
  # each key/value pair on this hash available as local variables
  #erb "<h1>Hello <%= name %></h1>", { :locals => { :name => params[:name] } }

  # since params already is a hash, and it already has the key name defined, we
  # can also just say
  erb "<h1>Hello <%= name %></h1>", { :locals => params }
end



# run this by simply doing $ ruby monstas.rb