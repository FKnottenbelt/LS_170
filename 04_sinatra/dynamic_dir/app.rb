require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "find"

get "/" do

  @files = []
  @reverse = params[:reverse]

  path_to_search = "./public"
  Find.find(path_to_search) do |file|
    @files << File.basename(file) if File.file?(file)
  end

  if @reverse == 'true'
    @files.sort!.reverse!
  else
    @files.sort!
  end

  @info = ['params', params, "files", @files]
  erb :home
end

