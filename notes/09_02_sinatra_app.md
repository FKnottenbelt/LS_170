# Setting up a Sintra application

### The basics
1. create:
- Gemfile
- app.rb

basic Gemfile:
```
source "https://rubygems.org"

gem "sinatra", "~>2.0.4"
gem "sinatra-contrib"      # so we can use Sinatra::ContentFor
gem "erubis"               # auto-escape content enabled erb

ruby "2.4.1"               # get same version when deployed elsewhere

group :development, :test do
  gem 'minitest'
  gem 'rake'                 # automate tasks
  gem 'minitest-reporters'   # colorfull test bar
  gem 'rack-test'            # for rack/test library and Rack::Test module
end
```

basic app.rb:
```
require "sinatra"
require "sinatra/reloader" if development?  # reload files on re-load of page
require "tilt/erubis"      # use erubis  with Tilt (support lots of template
                           # languases apart from erb)
require 'bundler/setup'    # use bundler

configure do
  enable :sessions
  set :session_secret, 'secret'

  set :erb, :escape_html => true   # auto-escape content. use <%== yield to block
end

get "/" do
  "hello world"
end
```

2. run `bundle install` to install dependencies
3. check by running ruby app.rb

### Basic frontend (views)
1. add a views directory
2. make a layout
3. make a home.erb
4. serve home.erb in home route
```
get '/' do
  erb :home, layout: :layout
end
```
5. test it out

### Adding tests with rack-test

1. write app_test.rb
```ruby
ENV["RACK_ENV"] = "test     # code is being tested

require "minitest/autorun"  # load minitest
require "rack/test"         # load rack-test

require_relative "../app"   # load our app

class AppTest < Minitest::Test  # standard minitest syntax
  include Rack::Test::Methods   # include rack-test methods

  def app                       # rack-test methods need method called app
    Sinatra::Application        # that returns a Rack application
  end

  def test_index
    get "/"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_equal "Hello, world!", last_response.body
  end
end
```

2. test your test `bundle exec ruby test/app_test.rb`
