require 'test_helper'

class QuestionariosControllerTest < ActionController::TestCase
  setup do
    @questionario = questionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionario" do
    assert_difference('Questionario.count') do
      post :create, questionario: { inicio_votacao: @questionario.inicio_votacao, nome: @questionario.nome, previsao_termino: @questionario.previsao_termino, termino_votacao: @questionario.termino_votacao }
    end

    assert_redirected_to questionario_path(assigns(:questionario))
  end

  test "should show questionario" do
    get :show, id: @questionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionario
    assert_response :success
  end

  test "should update questionario" do
    patch :update, id: @questionario, questionario: { inicio_votacao: @questionario.inicio_votacao, nome: @questionario.nome, previsao_termino: @questionario.previsao_termino, termino_votacao: @questionario.termino_votacao }
    assert_redirected_to questionario_path(assigns(:questionario))
  end

  test "should destroy questionario" do
    assert_difference('Questionario.count', -1) do
      delete :destroy, id: @questionario
    end

    assert_redirected_to questionarios_path
  end
end
