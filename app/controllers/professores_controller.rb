class ProfessoresController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :set_area, only: [:index, :new, :create]

  # GET /professores
  # GET /professores.json
  def index
    @professores = @area.professores
  end

  # GET /professores/1
  # GET /professores/1.json
  def show
  end

  # GET /professores/new
  def new
    @professor = @area.professores.new
  end

  # GET /professores/1/edit
  def edit
  end

  # POST /professores
  # POST /professores.json
  def create
    @professor = @area.professores.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'O Professor foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @professor }
      else
        format.html { render action: 'new' }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professores/1
  # PATCH/PUT /professores/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'O Professor foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professores/1
  # DELETE /professores/1.json
  def destroy
    redirect_to_path = area_professores_path(@professor.area)
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    def set_area
      @area = Area.find(params[:area_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:nome, :prontuario, :email, :usuario_id, :area_id)
    end
end
