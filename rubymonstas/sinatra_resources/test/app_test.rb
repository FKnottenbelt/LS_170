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
    create_document('members.txt','Johnny')
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content)
    new_doc = File.join(data_path, name)
    File.write(new_doc, content, mode:'w')
  end

  def session
    last_request.env["rack.session"]
  end

  ## Index
  def test_member_index
    get '/'

    assert_equal 200, last_response.status
    assert_includes last_response.body, '/Johnny'
  end

  ## Show
  def test_member_show
    get '/members/Johnny'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Johnny'
  end

  ## New
  def test_member_new
    get '/members/new'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Submit'
  end

  ## Create
  def test_member_create_valid_member
    post '/members', name: 'Carl'

    assert_equal 302, last_response.status
    assert_equal "Added Carl", session[:message]
  end

  def test_member_create_invalid_member_fails
    post '/members', name: 'Johnny'

    assert_equal 422, last_response.status
    assert_includes last_response.body, "Invalid name"
  end

  ## Edit
  def test_member_edit
    get '/members/Johnny/edit'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Submit'
  end

  ## Update
  def test_member_update_valid_name
    put '/members/Johnny', name: 'Johannes'

    assert_equal 302, last_response.status
    assert_equal "Changed name to: Johannes", session[:message]
  end

  def test_member_update_invalid_name_fails
    put '/members/Johnny', name: ''

    assert_equal 422, last_response.status
    assert_includes last_response.body, "Invalid name"
  end

  ## Delete
  def test_member_delete
    get '/members/Johnny/delete'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Remove Member'
  end

  ## Destroy
  def test_member_destroy
    delete '/members/Johnny'

    assert_equal 302, last_response.status
    assert_equal "Deleted Johnny", session[:message]
  end
end