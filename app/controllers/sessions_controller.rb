class SessionsController < ApplicationController

  def new
  end

  def create
    usuario = Usuario.find_by(nome: params[:session][:nome])
    if usuario #&& usuario.authenticate(params[:session][:senha])
      login usuario
      redirect_back_or usuario
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