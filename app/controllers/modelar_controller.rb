class ModelarController < ApplicationController
  
  before_action :set_questionario, only: [:index, :docente, :discente, :tae]

  def index
  end

  def show
  end
  
  def docente
    @docentes = Modelo.docente(@modelos = @questionario.modelos)
  end

  def discente
    @discentes = Modelo.discente(@modelos = @questionario.modelos)
  end

  def tae
    @taes = Modelo.tae(@modelos = @questionario.modelos)
  end

private

  def set_questionario
      @questionario = Questionario.find(params[:questionario_id])
  end
end
