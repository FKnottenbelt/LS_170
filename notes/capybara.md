# Capybara

see [here](https://aldtestaccount.wordpress.com/2016/02/06/testing-a-sinatra-app-with-capybara/)
if you gonna have a database en want to debug

> gemfile

```ruby
group :development, :test do
  gem 'minitest'    # Capybara uses minitest
  gem 'capybara'    # duh
  gem 'rake'        # for one place testing
  gem 'launchy'     # does not fully work, but allows saving of html
end
```

nb add `tmp/` to gitignore since launchy stuff will go there

> files

can be split further but for now:
/tests
  |- app_test.rb

app_test.rb:
```ruby
ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'capybara/minitest'

require_relative '../todo.rb'

class CapybaraTestCase < Minitest::Test   # capybara stuff in one place
  include Capybara::DSL
  include Capybara::Minitest::Assertions  # using minitest asserts

  Capybara.app = Sinatra::Application
  Capybara.save_path = './tmp/'

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

class TodoTest < CapybaraTestCase  # NB: inherit from capybara class!

  def test_homepage_redirects_to_lists
    visit '/'
    assert_current_path("/lists")
    assert_content("Todo Tracker")
  end

  def test_make_new_valid_todolist
    visit '/lists'
    click_link("New List")
    assert_content("Enter the name for your new list")

    fill_in 'list_name', with: 'Test List'
    click_button("Save")
    assert_content("Test List")
    assert_content("The list has been created")
  end

  def test_new_empty_todolist_gives_error
    visit '/lists'
    click_link("New List")
    assert_content("Enter the name for your new list")

    fill_in 'list_name', with: ' '
    click_button("Save")
    assert_content("List name must by between 1 and 100 characters")
  end

end
```

> syntax

visit '/'
assert page.has_content?("Todo Tracker")  # tekst on page
assert_content("Todo Tracker")            # assert method version

click_link("New List")  # tekst in link `<a>New List</a>`

click_button("Save")  # value of button
fill_in 'list_name', with: 'Test List' # list_name is name,
                                       # with is user input

print page.html  # prints html on current page to stdout

    # fill_in("skill[name]", with: "Skill name")
    # fill_in("skill[description]", with: "Skill description")
    # select "School", from: "category_id"
    # click_button("Submit")
    # assert_equal '/skills', current_path
    # within("#skill") do
    #   assert page.has_content?("Skill name")
    #   assert page.has_content?("school")
    # end
    # refute page.has_content?("work")

see also: https://www.sitepoint.com/basics-capybara-improving-tests/

**minitest assertions** (better error message):
https://www.rubydoc.info/gems/capybara/Capybara/Minitest/Assertions

**docs**:
https://github.com/teamcapybara/capybara#the-dsl


> run (without rake)

as usual: bundle exec ruby ./test/todo_test.rb

nb: your server does not need to be up.

> run (with rakefile)

bundle exec rake test

Rakefile:
```ruby
require "rake/testtask"

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end
```

> save html for debug

gem launchy in gemfile
`Capybara.save_path = './tmp/'` in you capybara test class
`save_and_open_page` in your test (will give error, but html in tmp)
put `tmp/`  in your gitignore