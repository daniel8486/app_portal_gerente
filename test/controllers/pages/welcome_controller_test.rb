require 'test_helper'

class Pages::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_welcome_index_url
    assert_response :success
  end

end
