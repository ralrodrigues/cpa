class FuncionariosController < ApplicationController
  before_action :set_questionario, only: [:index]
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]
  before_action :set_area, only: [:new, :create]

  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @questionario = Questionario.find(params[:questionario_id])
    @areas = @questionario.areas
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = @area.funcionarios.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = @area.funcionarios.new(funcionario_params)
    @funcionario.build_usuario(tipo: params[:funcionario][:usuarios][:tipo]).save

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to questionario_funcionarios_path(@funcionario.area.questionario), notice: 'O Funcionário foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @funcionario }
      else
        format.html { render action: 'new' }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        @funcionario.usuario.update_attributes(tipo: params[:funcionario][:usuarios][:tipo])
        format.html { redirect_to questionario_funcionarios_path(@funcionario.area.questionario), notice: 'O Funcionário foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    redirect_to_path = questionario_funcionarios_path(@funcionario.area.questionario)
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path,  notice: 'O Funcionário foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    def set_area
      @area = Area.find(params[:area_id])
    end

    def set_questionario
      @questionario = Questionario.find(params[:questionario_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :prontuario, :email, :usuario_id, :area_id )
    end
end
