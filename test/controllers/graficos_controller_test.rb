require 'test_helper'

class GraficosControllerTest < ActionController::TestCase
  test "should get graficos" do
    get :graficos
    assert_response :success
  end

end
