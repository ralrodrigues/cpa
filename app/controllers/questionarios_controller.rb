class QuestionariosController < ApplicationController
  before_action :set_questionario, only: [:show, :edit, :update, :destroy]
  before_action :questionario_encerrado, only: [:edit, :update, :destroy]
  
  def iniciar_votacao
    @questionario = Questionario.find(params[:questionario_id])
    @questionario.update_attributes(inicio_votacao: Time.now, previsao_termino: Time.now.advance(:months => 1))
    @questionario.iniciar_votacao
    redirect_to @questionario, notice: 'A votação foi iniciada.'
  end

  def encerrar_votacao
    @questionario = Questionario.find(params[:questionario_id])
    @questionario.update_attribute(:termino_votacao, Time.now)
    redirect_to @questionario, notice: 'A votação foi encerrada.'
  end
  
  def configuracoes
    @questionario = Questionario.find_by_nome("Configuração")
  end

  ENCERRADOS = 'inicio_votacao is not null and termino_votacao is not null'

  def encerrados
    @questionarios_encerrados = Questionario.where(ENCERRADOS)
  end

  # GET /questionarios
  # GET /questionarios.json
  def index
    @questionarios = Questionario.where.not(ENCERRADOS)
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
        format.html { redirect_to @questionario, notice: 'O CPA foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @questionario }
      else
        format.html { render action: 'new' }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionarios/1
  # PATCH/PUT /questionarios/1.json
  def update
    respond_to do |format|
      if @questionario.update(questionario_params)
        format.html { redirect_to @questionario, notice: 'O CPA foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionarios/1
  # DELETE /questionarios/1.json
  def destroy
    @questionario.destroy
    respond_to do |format|
      format.html { redirect_to questionarios_url }
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
