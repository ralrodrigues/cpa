require 'test_helper'

class AvaliacoesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
