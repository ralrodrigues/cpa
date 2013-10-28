class SessionsController < ApplicationController

  def new
  end

  def create
    usuario = Usuario.find_by(nome: params[:session][:nome])
    if usuario #&& usuario.authenticate(params[:session][:senha])
      login usuario
      if usuario.tipo != 'Administrador'
        redirect_to usuario_respostas_path(usuario), alert: "Carregando Questionário"
      else 
        redirect_to root_path, alert: "Carregando Painel de Controle"
      end
    else
      flash.now[:error] = 'Usuário/Senha Inválidos'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end