class ModelosController < ApplicationController
  before_action :signed_in_usuario
  before_action :is_administrador?
  
  before_action :set_modelo, only: [:show, :edit, :update, :destroy]
  before_action :set_questionario, only: [:index, :new, :create, :docente, :discente, :tae, :senhas]

  # GET /modelos
  # GET /modelos.json
  def index
    @modelos = @questionario.modelos
  end

  # GET /modelos/1
  # GET /modelos/1.json
  def show
  end

  # GET /modelos/new
  def new
    @modelo = @questionario.modelos.new
  end

  # GET /modelos/1/edit
  def edit
  end

  # POST /modelos
  # POST /modelos.json
  def create
    @modelo = @questionario.modelos.new(modelo_params)

    respond_to do |format|
      if @modelo.save
        format.html { redirect_to questionario_modelos_path(@modelo.questionario), notice: 'O Modelo foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @modelo }
      else
        format.html { render action: 'new', notice: 'O Modelo não foi criado com sucesso.' }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelos/1
  # PATCH/PUT /modelos/1.json
  def update
    respond_to do |format|
      if @modelo.update(modelo_params)
        format.html { redirect_to questionario_modelos_path(@modelo.questionario), notice: 'O Modelo foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: 'O Modelo foi atualizado com sucesso.' }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelos/1
  # DELETE /modelos/1.json
  def destroy
    redirect_to_path = questionario_modelos_path(@modelo.questionario)
    @modelo.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path }
      format.json { head :no_content }
    end
  end

  def docente
    @docentes = Modelo.where(nome: 'Global Docente', questionario_id: @questionario)
    @docentes += Modelo.where(nome: 'Turma Docente', questionario_id: @questionario)
  end

  def discente
    @discentes = Modelo.where(nome: 'Global Discente', questionario_id: @questionario)
    @discentes += Modelo.where(nome: 'Turma Dicente', questionario_id: @questionario)
  end

  def tae
    @taes = Modelo.where(nome: 'Global TAE', questionario_id: @questionario)
  end

  private   

    # Use callbacks to share common setup or constraints between actions.
    def set_modelo
      @modelo = Modelo.find(params[:id])
    end

    def set_questionario
      @questionario = Questionario.find(params[:questionario_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def modelo_params
      params.require(:modelo).permit(:nome, :questionario_id)
    end
end


