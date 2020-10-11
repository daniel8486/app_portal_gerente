require 'test_helper'

class Pages::PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_payment_index_url
    assert_response :success
  end

end
