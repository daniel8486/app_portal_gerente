require 'test_helper'

class Pages::AcompFuncControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_acomp_func_index_url
    assert_response :success
  end

end
