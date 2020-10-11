require 'test_helper'

class Pages::MoneyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_money_index_url
    assert_response :success
  end

end
