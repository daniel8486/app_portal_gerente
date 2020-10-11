require 'test_helper'

class Pages::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_user_index_url
    assert_response :success
  end

end
