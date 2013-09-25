class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_action :set_questionario, only: [:index, :coordenadores, :new, :create]
  
  # GET /areas
  # GET /areas.json
  def index
    @areas = @questionario.areas
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = @questionario.areas.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = @questionario.areas.new(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to questionario_areas_path(@area.questionario), notice: 'A Área foi criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @area }
      else
        format.html { render action: 'new' }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to questionario_areas_path(@area.questionario), notice: 'A Área foi atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    redirect_to_path = questionario_areas_path(@area.questionario)
    @area.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path, notice: 'A Área foi deletada com sucesso.'}
      format.json { head :no_content }
    end
  end

  def coordenadores
    @areas = @questionario.areas
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end
    
    def set_questionario
      @questionario = Questionario.find(params[:questionario_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:nome, :usuario_id, :questionario_id, :funcionario_id)
    end
end
