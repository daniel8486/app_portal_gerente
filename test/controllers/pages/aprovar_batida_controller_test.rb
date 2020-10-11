require 'test_helper'

class Pages::AprovarBatidaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_aprovar_batida_index_url
    assert_response :success
  end

end
