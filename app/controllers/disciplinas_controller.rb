class DisciplinasController < ApplicationController
  before_action :set_disciplina, only: [:show, :edit, :update, :destroy]
  before_action :set_curso, only: [:index, :new, :create]

  # GET /disciplinas
  # GET /disciplinas.json
  def index
    @disciplinas = @curso.disciplinas
  end

  # GET /disciplinas/1
  # GET /disciplinas/1.json
  def show
  end

  # GET /disciplinas/new
  def new
    @disciplina = @curso.disciplinas.new
  end

  # GET /disciplinas/1/edit
  def edit
  end

  # POST /disciplinas
  # POST /disciplinas.json
  def create
    @disciplina = @curso.disciplinas.new(disciplina_params)

    respond_to do |format|
      if @disciplina.save  
        @disciplina.create_turmas
        format.html { redirect_to curso_disciplinas_path(@disciplina.curso), notice: 'A Disciplina foi criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @disciplina }
      else
        format.html { render action: 'new' }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplinas/1
  # PATCH/PUT /disciplinas/1.json
  def update
    respond_to do |format|
      if @disciplina.update(disciplina_params)
        @disciplina.create_turmas         
        format.html { redirect_to curso_disciplinas_path(@disciplina.curso), notice: 'A Disciplina foi atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render js on: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplinas/1
  # DELETE /disciplinas/1.json
  def destroy
    redirect_to_path = curso_disciplinas_path(@disciplina.curso)
    @disciplina.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path, notice: 'Disciplina deletada com sucesso'  }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    if (params[:disciplinas]).nil? 
      redirect_to curso_disciplinas_path(params[:curso_id]), notice: 'Nenhuma disciplina selecionada'
    else  
      Disciplina.destroy(params[:disciplinas])
      redirect_to curso_disciplinas_path(params[:curso_id]), notice: 'Disciplinas deletadas com sucesso' 
    end

    # render text: params.inspect
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disciplina
      @disciplina = Disciplina.find(params[:id])
    end

    def set_curso
      @curso = Curso.find(params[:curso_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disciplina_params
      params.require(:disciplina).permit(:nome, :sigla, :qtd_professores, :curso_id)
    end
end
