require 'test_helper'

class Api::BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_blogs_index_url
    assert_response :success
  end

end
