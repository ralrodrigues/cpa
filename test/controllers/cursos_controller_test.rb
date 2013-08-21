require 'test_helper'

class CursosControllerTest < ActionController::TestCase
  setup do
    @curso = cursos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curso" do
    assert_difference('Curso.count') do
      post :create, curso: { area_id: @curso.area_id, nivel: @curso.nivel, nome: @curso.nome, observacao: @curso.observacao, periodo: @curso.periodo, qtd_alunos: @curso.qtd_alunos, questionario_id: @curso.questionario_id, semestre_atual: @curso.semestre_atual, semestres_duracao: @curso.semestres_duracao, sigla: @curso.sigla }
    end

    assert_redirected_to curso_path(assigns(:curso))
  end

  test "should show curso" do
    get :show, id: @curso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @curso
    assert_response :success
  end

  test "should update curso" do
    patch :update, id: @curso, curso: { area_id: @curso.area_id, nivel: @curso.nivel, nome: @curso.nome, observacao: @curso.observacao, periodo: @curso.periodo, qtd_alunos: @curso.qtd_alunos, questionario_id: @curso.questionario_id, semestre_atual: @curso.semestre_atual, semestres_duracao: @curso.semestres_duracao, sigla: @curso.sigla }
    assert_redirected_to curso_path(assigns(:curso))
  end

  test "should destroy curso" do
    assert_difference('Curso.count', -1) do
      delete :destroy, id: @curso
    end

    assert_redirected_to cursos_path
  end
end
