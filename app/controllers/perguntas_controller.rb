class PerguntasController < ApplicationController
  before_action :signed_in_usuario

  before_action :set_pergunta, only: [:show, :edit, :update, :destroy]
  before_action :set_topico, only: [:index, :new, :create]

  # GET /perguntas
  # GET /perguntas.json
  def index
    # @usuarios = @topico.perguntas.usuarios
  end

  # GET /perguntas/1
  # GET /perguntas/1.json
  def show
    @usuarios = 
  end

  # GET /perguntas/new
  def new
    @pergunta = @topico.perguntas.new
  end

  # GET /perguntas/1/edit
  def edit
  end

  # POST /perguntas
  # POST /perguntas.json
  def create
    @pergunta = @topico.perguntas.new(pergunta_params)

    respond_to do |format|
      if @pergunta.save
        format.html { redirect_to set_path, notice: 'Pergunta criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @pergunta }
      else
        format.html { render action: 'new' }
        format.json { render json: @pergunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perguntas/1
  # PATCH/PUT /perguntas/1.json
  def update
    respond_to do |format|
      redirect_to_path = @pergunta
      if @pergunta.update(pergunta_params)
        format.html { redirect_to set_path, notice: "Pergunta atualizada com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pergunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perguntas/1
  # DELETE /perguntas/1.json
  def destroy
    redirect_to_path = topico_perguntas_path(@pergunta.topico)
    @pergunta.destroy
    respond_to do |format|
      format.html { redirect_to set_path, notice: "Pergunta deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_path
      redirect_to_path = ''
      if @pergunta.topico.modelo.nome.to_s == "Global Docente" || @pergunta.topico.modelo.nome.to_s == "Turma Docente"
        return redirect_to_path = docente_questionario_modelos_path(@pergunta.topico.modelo.questionario.id)      
      elsif @pergunta.topico.modelo.nome.to_s == "Global Discente" || @pergunta.topico.modelo.nome.to_s == "Turma Dicente"
        return redirect_to_path = discente_questionario_modelos_path(@pergunta.topico.modelo.questionario.id)    
      elsif @pergunta.topico.modelo.nome.to_s == "Global TAE"
        return redirect_to_path = tae_questionario_modelos_path(@pergunta.topico.modelo.questionario.id)
      end
    end
    helper_method :set_path

    def set_pergunta
      @pergunta = Pergunta.find(params[:id])
    end

    def set_topico
      @topico = Topico.find(params[:topico_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pergunta_params
      params.require(:pergunta).permit(:enunciado, :tipo, :topico_id)
    end
end
