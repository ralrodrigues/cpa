class TopicosController < ApplicationController
  before_action :set_topico, only: [:show, :edit, :update, :destroy]
  before_action :set_modelo, only: [:index, :new, :create]

  # GET /topicos
  # GET /topicos.json
  def index
    @topicos = @modelo.topicos
  end

  # GET /topicos/1
  # GET /topicos/1.json
  def show
  end

  # GET /topicos/new
  def new
    @topico = @modelo.topicos.new
  end

  # GET /topicos/1/edit
  def edit
  end

  # POST /topicos
  # POST /topicos.json
  def create
    @topico = @modelo.topicos.new(topico_params)

    respond_to do |format|
      if @topico.save
        format.html { redirect_to set_path, notice: 'Tópico criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @topico }
      else
        format.html { render action: 'new' }
        format.json { render json: @topico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topicos/1
  # PATCH/PUT /topicos/1.json
  def update
    respond_to do |format|
      if @topico.update(topico_params)
        format.html { redirect_to set_path, notice: 'Tópico atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @topico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topicos/1
  # DELETE /topicos/1.json
  def destroy
    @topico.destroy
    respond_to do |format|
      format.html { redirect_to set_path, notice: 'Tópico deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_path
      redirect_to_path = ''
      if @topico.modelo.nome.to_s == "Global Docente" || @topico.modelo.nome.to_s == "Turma Docente"
        return redirect_to_path = docente_questionario_modelos_path(@topico.modelo.questionario.id)      
      elsif @topico.modelo.nome.to_s == "Global Discente" || @topico.modelo.nome.to_s == "Turma Dicente"
        return redirect_to_path = discente_questionario_modelos_path(@topico.modelo.questionario.id)    
      elsif @topico.modelo.nome.to_s == "Global TAE"
        return redirect_to_path = tae_questionario_modelos_path(@topico.modelo.questionario.id)
      end
    end
    helper_method :set_path

    def set_topico
      @topico = Topico.find(params[:id])
    end

    def set_modelo
      @modelo = Modelo.find(params[:modelo_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topico_params
      params.require(:topico).permit(:nome, :modelo_id)
    end
end
