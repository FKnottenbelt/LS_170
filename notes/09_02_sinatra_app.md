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

