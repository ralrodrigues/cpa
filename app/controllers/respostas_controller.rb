class RespostasController < ApplicationController
  before_action :signed_in_usuario
  
  before_action :set_usuario, only: [:index, :update_multiple]

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

  # # POST /respostas
  # # POST /respostas.json
  # def create
  #   @resposta = @usuario.respostas.new(resposta_params)
  #   @resposta.build_usuario(tipo: params[:resposta][:usuarios][:tipo]).save
  #   respond_to do |format|
  #     if @resposta.save
  #       format.html { redirect_to usuario_respostas_path(@usuario), notice: 'O Funcionário foi criado com sucesso.' }
  #       format.json { render action: 'show', status: :created, location: @resposta }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @resposta.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /respostas/1
  # PATCH/PUT /respostas/1.json
  def update
    # render text: params.inspect
    respond_to do |format|
      @resposta = Resposta.find(params[:resposta])
      if @resposta.update(resposta_params)
        format.html { }
        format.json { head :no_content }
      else
        format.html { }
        format.json { render json: @resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_multiple
    begin
      
      respostas_rp = params[:respostas]
      # render text: respostas_rp.inspect
      respostas_id = @usuario.respostas.sort_by{|e| -e[:id]}
      
      respostas_id.each do |resposta|
        if resposta.resposta.nil?
          tmp = respostas_rp.pop
          if tmp != ''
            resposta.resposta = tmp
            resposta.save
          end  
        end
      end

      redirect_to usuario_respostas_path(@usuario), notice: 'Respostas Enviadas com Sucesso'

    rescue => ex
      logger.error ex.message
      redirect_to usuario_respostas_path(@usuario), notice: 'ERROR'
    end   

    # if (params[:respostas]).nil? 
    #   redirect_to usuario_respostas_path(@usuario), notice: 'Nenhuma Resposta Selecionada'
    # else  
    #   # Pergunta.destroy(params[:perguntas])
    #   redirect_to root_path, notice: 'Respostas Enviadas com Sucesso' 
    # end
    # render text: respostas.inspect
  end

  def find_funcionario(turma)
    @funcionarios = Funcionario.select("nome").where(:id => turma)
    @funcionarios.each do |funcionario|
      return funcionario.nome
    end
    return "Professor não encontrado"
  end     
  helper_method :find_funcionario
  
  # DELETE /respostas/1
  # DELETE /respostas/1.json
  def destroy
    # redirect_to_path = usuario_respostas_path(@resposta.usuario)
    # @resposta.destroy
    # respond_to do |format|
    #   format.html { redirect_to redirect_to_path,  notice: 'O Funcionário foi deletado com sucesso.' }
    #   format.json { head :no_content }
    # end
  end
  
  def votar(usuario)
    @usuario = Usuario.where(:nome => usuario)  
    return @usuario.to_a
  end
  helper_method :votar
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:usuario_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resposta_params
      params.require(:resposta).permit(:resposta, :usuario_id, :turma_id, :pergunta_id)
    end
end
