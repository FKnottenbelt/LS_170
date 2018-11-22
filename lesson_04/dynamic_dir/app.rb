require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "find"

get "/" do
  @files = []

  path_to_search = "./public"
  Find.find(path_to_search) do |file|
    @files << File.basename(file) if File.file?(file)
  end

  erb :home
end
