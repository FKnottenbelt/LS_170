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
  # when our templates grow, we want to put them in seperate files
  # sinatra wants them in the views folder
  # when we pass erb a symbol instead of a string then Sinatra assumes
  # this is part of a filename, and it will look for a template file
  # in a directory views.

  # erb template, { :locals => params, :layout => layout } # old

  # erb :monstas, { :locals => params, :layout => :layout }

  # we don’t even need the name the layout. Sinatra looks for this
  # filename by default
  #erb :monstas, { :locals => params, :layout => true }

  # we can also even totally omit the option, because Sinatra assumes
  # we want a layout
  erb :monstas, { :locals => params }
end



# run this by simply doing $  ruby monstas_04_erb.rb