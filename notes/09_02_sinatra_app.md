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
                           # and the sinatra/reloader
gem "erubis"               # auto-escape content enabled erb

ruby "2.4.1"               # get same version when deployed elsewhere

group :development, :test do
  gem 'minitest'
  gem 'rake'                 # automate tasks
  gem 'minitest-reporters'   # colorfull test bar
  gem 'rack-test'            # for rack/test library and Rack::Test module
  gem 'capybara'             # for adding acc tests
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

1. write racktest_helper.rb
```ruby
ENV["RACK_ENV"] = "test     # code is being tested

require "minitest/autorun"  # load minitest
require "rack/test"         # load rack-test

require_relative "../app"   # load our app

class RackTestCase < Minitest::Test  # standard minitest syntax
  include Rack::Test::Methods        # include rack-test methods

  def app                       # rack-test methods need method called app
    Sinatra::Application        # that returns a Rack application
  end
end
```
2. write your testfile app_test.rb
```ruby
require_relative './racktest_helper'  # load our helper class

class CmsTest < RackTestCase    # inherit from our helper class

  def test_index
    get "/"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_equal "Hello, world!", last_response.body
  end
end
```

2. test your test `bundle exec ruby test/app_test.rb`

### Adding accept tests with capybara

1. write capybara_helper.rb
```ruby
ENV["RACK_ENV"] = "test"

require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
require 'capybara/minitest'

require_relative '../app.rb'

class CapybaraTestCase < Minitest::Test
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  Capybara.app = Sinatra::Application

  Capybara.save_path = './tmp/'   # only when using gem launchy

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
```

2. write app_acc_test.rb
```ruby
require_relative './capybara_helper'

class AppAcceptTest < CapybaraTestCase

  def setup
    visit '/lists'
    click_link("New List")
    fill_in 'list_name', with: 'Vacation'
    click_button("Save")
  end

  def test_acc_test_have_run
    puts "Acc tests running"
  end
end
```

3. check if running with `bundle exec ruby test/app_acc_test.rb`

### Adding Rake test taks
1. make Rakefile
```
require "rake/testtask"

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end
```
2. test by running `rake`
