class RespostassController < ApplicationController
  before_action :set_resposta, only: [:show, :edit, :update, :destroy]
  before_action :set_usuario, only: [:index, :new, :create]

  # GET /respostas
  # GET /respostas.json
  def index
  end

  # GET /respostas/1
  # GET /respostas/1.json
  def show
  end

  # GET /respostas/new
  def new
    @resposta = @usuarios.respostas.new
  end

  # GET /respostas/1/edit
  def edit
  end

  # POST /respostas
  # POST /respostas.json
  def create
    @resposta = @usuario.respostas.new(resposta_params)
    @resposta.build_usuario(tipo: params[:resposta][:usuarios][:tipo]).save
    respond_to do |format|
      if @resposta.save
        format.html { redirect_to usuario_respostas_path(@usuario), notice: 'O Funcionário foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @resposta }
      else
        format.html { render action: 'new' }
        format.json { render json: @resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respostas/1
  # PATCH/PUT /respostas/1.json
  def update
    # render text: params.inspect
    respond_to do |format|
      if @resposta.update(resposta_params)
        @resposta.usuario.update_attributes(tipo: params[:resposta][:usuarios][:tipo])
        format.html { redirect_to usuario_respostas_path(@resposta.usuario), notice: 'O Funcionário foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respostas/1
  # DELETE /respostas/1.json
  def destroy
    redirect_to_path = usuario_respostas_path(@resposta.usuario)
    @resposta.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to_path,  notice: 'O Funcionário foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    if (params[:respostas]).nil? 
      redirect_to usuario_respostas_path(params[:usuario_id]), notice: 'Nenhum funcionário selecionado'
    else  
      resposta.destroy(params[:respostas])
      redirect_to usuario_respostas_path(params[:usuario_id]), notice: 'Funcionários deletados com sucesso' 
    end

    # render text: params.inspect
  end
  
  def votar(usuario)
    @usuario = Usuario.where(:nome => usuario)  
    return @usuario.to_a
  end
  helper_method :votar
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resposta
      @resposta = resposta.find(params[:id])
    end

    def set_usuario
      @usuario = usuario.find(params[:usuario_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resposta_params
      params.require(:resposta).permit(:resposta, :usuario_id, :turma_id, :pergunta_id)
    end
end
