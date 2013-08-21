require 'test_helper'

class TaesControllerTest < ActionController::TestCase
  setup do
    @tae = taes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tae" do
    assert_difference('Tae.count') do
      post :create, tae: { email: @tae.email, nome: @tae.nome, prontuario: @tae.prontuario, usuario_id: @tae.usuario_id }
    end

    assert_redirected_to tae_path(assigns(:tae))
  end

  test "should show tae" do
    get :show, id: @tae
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tae
    assert_response :success
  end

  test "should update tae" do
    patch :update, id: @tae, tae: { email: @tae.email, nome: @tae.nome, prontuario: @tae.prontuario, usuario_id: @tae.usuario_id }
    assert_redirected_to tae_path(assigns(:tae))
  end

  test "should destroy tae" do
    assert_difference('Tae.count', -1) do
      delete :destroy, id: @tae
    end

    assert_redirected_to taes_path
  end
end
