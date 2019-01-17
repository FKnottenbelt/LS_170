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

class NameValidator
  attr_reader :message

  def initialize(name, names)
    @name = name.to_s
    @names = names
  end

  def valid?
    validate
    @message.nil?
  end

  private

  def validate
    if @name.empty?
      @message = "You need to enter a name."
    elsif @names.include?(@name)
      @message = "#{@name} is already included in our list."
    end
  end
end

enable :sessions

get "/" do
  "OMG, hello Ruby Monstas!"
end

get "/signup" do
  "Here you can sign up for the next beginners course."
end

post "/signin" do
  # do something to sign in the user
end

get "/monstas" do
  @name = params["name"]
  @names = read_names
  @message = session.delete(:message)

  erb :monstas_10
end

post "/monstas" do
  @name = params["name"]
  validator = NameValidator.new(@name, read_names)

  if validator.valid?
    store_name("names.txt", @name)
    session[:message] = "Successfully stored the name #{@name}."
  else
    session[:message] = validator.message
  end

  redirect "/monstas?name=#{@name}"
end


