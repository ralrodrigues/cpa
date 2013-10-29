class GraficosController < ApplicationController
  before_action :signed_in_usuario
  before_action :is_administrador?
  before_action :set_questionario, only: [:index]

  def index
  	if @questionario.encerrado?
  		@usuarios = Usuario.all 
  	else
  		redirect_to @questionario, notice: 'Questionário ainda não foi encerrado.' 
  	end
  end
  
  private

  def set_questionario
      @questionario = Questionario.find(params[:questionario_id])
  end

end
