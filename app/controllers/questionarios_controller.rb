class QuestionariosController < ApplicationController
  before_action :set_questionario, only: [:show, :edit, :update, :destroy]

  # GET /questionarios
  # GET /questionarios.json
  def index
    @questionarios = Questionario.all
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
    @questionario = Questionario.new(questionario_params)

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
end
