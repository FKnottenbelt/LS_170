ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'rack/test'
require_relative '../app.rb'

class AppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content)
    new_doc = File.join(data_path, name)
    File.write(new_doc, content, mode:'w')
  end

  def test_index_page
    create_document('members.txt','Johnny')
    get '/'

    assert_equal 200, last_response.status
    assert_includes last_response.body, '/Johnny'
  end

  def test_show_page
    create_document('members.txt','Johnny')
    get '/members/Johnny'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Johnny'
  end
end