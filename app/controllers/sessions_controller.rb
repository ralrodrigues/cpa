class SessionsController < ApplicationController

  def new
  end

  def create
    usuario = Usuario.find_by(nome: params[:session][:nome])
    if usuario && usuario.authenticate(params[:session][:senha])
      login usuario
      if usuario.tipo != 'Administrador'
        redirect_to usuario_respostas_path(usuario), alert: "Carregando Questionário"
      else 
        redirect_to questionarios_path, alert: "Carregando Painel de Controle"
      end
    else
      flash.now[:error] = 'Usuário/Senha Inválidos'
      render 'new'
    end
  end

  def create
    nome_de_usuario = params[:session][:nome] 
    senha = params[:session][:senha] 

    usuario = Usuario.find_by(nome: nome_de_usuario, senha: senha)

    if usuario
      login usuario
      if usuario.tipo == "Administrador"
        redirect_to questionarios_path, notice: "ADMINISTRADOR"
      else
        redirect_to usuario_respostas_path(usuario), notice: "PADRAO"
      end
    else 
      redirect_to login_path, notice: "Usuário/Senha Inválidos"
    end


    # if usuario.senha == params[:session][:senha]
    #   login usuario
    #   redirect_to usuario_respostas_path(usuario)
    # else 
    #   redirect_to login_path, notice: "Teste"
    # end
    # render text: params[:session].inspect
  end

  def destroy
    logout
    redirect_to root_url
  end
end