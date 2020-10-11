require 'test_helper'

class UsersOffice::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_office_login_index_url
    assert_response :success
  end

end
