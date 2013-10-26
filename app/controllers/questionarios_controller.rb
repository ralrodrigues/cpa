# CREATE
#   SO CRIA COM BASE NO CONFIGURACAO

# UPDATE
#   PRE
#     NOME
#   VOT
#     NOME
#     PREVISAO_TERMINO

# DESTROY
#   PRE

class QuestionariosController < ApplicationController
  before_action :signed_in_usuario, only: [:index]

  before_action :set_questionario, only: [:show, :edit, :update, :destroy]
  before_action :questionario_encerrado, only: [:edit, :update, :destroy]
  
  def teste
    # docente = Funcionario.includes(:usuario, :area).where("usuarios.tipo" => "Docente", "areas.questionario_id" => @questionario).to_a
    # perguntas = Pergunta.find_by_sql("SELECT * FROM perguntas, topicos, modelos WHERE perguntas.topico_id = topicos.id AND topicos.modelo_id = modelos.id AND modelos.nome LIKE 'Global Docente' AND modelos.questionario_id = "+@questionario.id.to_s+";")

  end
  helper_method :teste

  def iniciar_votacao
    questionario = Questionario.find(params[:questionario_id])
    if questionario.em_preparacao?
      questionario.iniciar_votacao
      redirect_to questionario, notice: 'A votação foi iniciada com sucesso.'
    else
      redirect_to questionario, notice: 'A votação não foi iniciada. Somente CPAs em Preparação podem ser iniciados.'
    end
  end

  def encerrar_votacao
    questionario = Questionario.find(params[:questionario_id])

    if questionario.em_votacao?
      questionario.update_attribute(:termino_votacao, Time.now)
      redirect_to questionario, notice: 'A votação foi encerrada com sucesso.'
    else
      redirect_to questionario, notice: 'A votação não foi encerrada. Somente CPAs em Votação podem ser encerrados.'
    end
  end
  
  def configuracoes
    @questionario = Questionario.find(1)
  end

  ENCERRADOS = 'inicio_votacao is not null and termino_votacao is not null and id != 1'
  def encerrados
    @encerrados = Questionario.where(ENCERRADOS)
  end

  # GET /questionarios
  # GET /questionarios.json
  def index
    questionarios = Questionario.where.not(ENCERRADOS)
    @preparacao   = Questionario.em_preparacao(questionarios)
    @votacao      = Questionario.em_votacao(questionarios)
    @encerrados = Questionario.where(ENCERRADOS)
    @questionario = Questionario.new
  end

  # GET /questionarios/1
  # GET /questionarios/1.json
  def show
  end

  # GET /questionarios/new
  def new
    @questionario = Questionario.new
  end

  # GET /questionarios/1/edit
  def edit
  end

  # POST /questionarios
  # POST /questionarios.json
  def create
    old_cpa = Questionario.find(1)

    @questionario = old_cpa.amoeba_dup
    @questionario.nome = (questionario_params[:nome])
    @questionario.inicio_votacao = nil
    @questionario.termino_votacao = nil
    @questionario.previsao_termino = nil
    
    respond_to do |format|
      if @questionario.save
        format.html { redirect_to questionario_path(@questionario), notice: 'O Questionário ' +@questionario.nome+', foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @questionario }
      else
        format.html { render action: 'new', notice: 'Ocorreu um erro, tente novamente.' }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionarios/1
  # PATCH/PUT /questionarios/1.json
  def update
    respond_to do |format|
      if @questionario.update(questionario_params)
        format.html { redirect_to questionario_path(@questionario), notice: 'O Questionário foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: 'Ocorreu um erro, tente novamente.' }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionarios/1
  # DELETE /questionarios/1.json
  def destroy
    @questionario.destroy
    respond_to do |format|
      format.html { redirect_to questionarios_url, notice: 'O Questionário foi deletado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionario
      @questionario = Questionario.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def questionario_params
      params.require(:questionario).permit(:nome, :inicio_votacao, :previsao_termino, :termino_votacao)
    end

    def questionario_encerrado
      if @questionario.encerrado?
        redirect_to @questionario, notice: 'O CPA não pode ser alterado pois já está encerrado.'
      end
    end
end
