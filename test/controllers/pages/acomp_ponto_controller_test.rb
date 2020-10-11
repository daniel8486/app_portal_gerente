require 'test_helper'

class Pages::AcompPontoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_acomp_ponto_index_url
    assert_response :success
  end

end
