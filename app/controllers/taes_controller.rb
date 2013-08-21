class TaesController < ApplicationController
  before_action :set_tae, only: [:show, :edit, :update, :destroy]
  before_action :set_area, only: [:index, :new, :create]

  # GET /taes
  # GET /taes.json
  def index
    @taes = Tae.joins(:usuario).where('usuarios.area_id' => @area.id)
  end

  # GET /taes/1
  # GET /taes/1.json
  def show
  end

  # GET /taes/new
  def new
    @usuario = @area.usuarios.new
    @tae = @usuario.build_tae
  end

  # GET /taes/1/edit
  def edit
  end

  # POST /taes
  # POST /taes.json
  def create
    @usuario = @area.usuarios.create(tipo: "TAE")
    @tae = @usuario.build_tae(tae_params)

    respond_to do |format|
      if @tae.save
        format.html { redirect_to @tae, notice: 'O TAE foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @tae }
      else
        format.html { render action: 'new' }
        format.json { render json: @tae.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taes/1
  # PATCH/PUT /taes/1.json
  def update
    respond_to do |format|
      if @tae.update(tae_params)
        format.html { redirect_to @tae, notice: 'O TAE foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tae.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taes/1
  # DELETE /taes/1.json
  def destroy
    redirect_to_path =  area_taes_path(@tae.usuario.area)
    @tae.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tae
      @tae = Tae.find(params[:id])
    end

    def set_area
      @area = Area.find(params[:area_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tae_params
      params.require(:tae).permit(:nome, :prontuario, :email, :usuario_id, usuarios_attributes: [ :id, :nome, :senha, :tipo, :area_id ])
    end
end
