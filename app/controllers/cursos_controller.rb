class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_action :set_questionario, only: [:index, :new, :create, :votacao]

  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = @questionario.cursos.sort
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
  end

  # GET /cursos/new
  def new
    @curso = @questionario.cursos.new
  end

  # GET /cursos/1/edit
  def edit
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = @questionario.cursos.new(curso_params)

    respond_to do |format|
      if @curso.save
        format.html { redirect_to questionario_cursos_path(@curso.questionario), notice: 'O Curso foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @curso }
      else
        format.html { render action: 'new' }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to questionario_cursos_path(@curso.questionario), notice: 'O Curso foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    redirect_to_path = questionario_cursos_path(@curso.questionario)
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path, notice: 'Curso Deletado com Sucesso' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    if (params[:cursos]).nil? 
      redirect_to questionario_cursos_path(params[:questionario_id]), notice: 'Nenhum Curso selecionado'
    else  
      Curso.destroy(params[:cursos])
      redirect_to questionario_cursos_path(params[:questionario_id]), notice: 'Cursos Deletados com Sucesso' 
    end
  end

  def duplicate
    @curso = Curso.find(params[:curso_id])
    cursoDuplicado = @curso.amoeba_dup
    cursoDuplicado.save
    redirect_to questionario_cursos_path(@curso.questionario), notice: 'Curso Duplicado com Sucesso' 
  end
  
  def votacao
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    def set_questionario
      @questionario = Questionario.find(params[:questionario_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:nome, :sigla, :nivel, :periodo, :semestre_atual, :semestres_duracao, :qtd_alunos, :observacao, :questionario_id, :area_id)
    end

end
