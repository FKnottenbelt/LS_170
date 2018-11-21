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
  # :name is put in the param hash by sinatra.
  # now we want a layout wrapper to suply the html and body tags
  # so we add the :layout option to the options hash.
  # at `yield` the template will be inserted.
  template = "<h1>Hello <%= name %></h1>"
  layout   = "<html><body><%= yield %></body></html>"

  erb template, { :locals => params, :layout => layout }
end



# run this by simply doing $  ruby monstas_03_erb.rb