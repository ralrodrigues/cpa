class TurmasController < ApplicationController
  before_action :signed_in_usuario
  before_action :is_administrador?
  
  before_action :set_turma, only: [:show, :edit, :update, :destroy]
  before_action :set_disciplina, only: [:index, :new, :create]
  before_action :set_professor, only:[:index, :edit]

  # GET /turmas
  # GET /turmas.json
  def index
    @turmas = @disciplina.turmas.sort
  end

  # GET /turmas/1
  # GET /turmas/1.json
  def show
  end

  # GET /turmas/new
  def new
    @turma = @disciplina.turmas.new
  end

  # GET /turmas/1/edit
  def edit
  end

  # POST /turmas
  # POST /turmas.json
  def create
    @turma = @disciplina.turmas.new(turma_params)

    respond_to do |format|
      if @turma.save
        format.html { redirect_to @turma, notice: 'A Turma foi criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @turma }
      else
        format.html { render action: 'new' }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turmas/1
  # PATCH/PUT /turmas/1.json
  def update
    respond_to do |format|
      if @turma.update(turma_params)
        format.html { redirect_to disciplina_turmas_path(@turma.disciplina), notice: 'A Turma foi atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turmas/1
  # DELETE /turmas/1.json
  def destroy
    redirect_to_path = disciplina_turmas_path(@turma.disciplina)
    @turma.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path }
      format.json { head :no_content }
    end
  end
    
  def find_funcionarios
    return @funcionarios = Funcionario.includes(:usuario, :area).where("usuarios.tipo" => "Docente", "areas.questionario_id" => @turma.disciplina.curso.questionario).order("usuarios.nome ASC")
  end     
  helper_method :find_funcionarios 

  def find_funcionario(turma)
    @funcionarios = Funcionario.select("nome").where(:id => turma)
    @funcionarios.each do |funcionario|
      return funcionario.nome
    end
    return "Professor não encontrado"
  end     
  helper_method :find_funcionario

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_professor
      if params[:professor_id]
        @funcionario = Funcionario.find(params[:professor_id])
      end
    end

    def set_turma
      @turma = Turma.find(params[:id])
    end

    def set_disciplina
      @disciplina = Disciplina.find(params[:disciplina_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turma_params
      params.require(:turma).permit(:sigla, :disciplina_id, :professor_id)
    end
end
