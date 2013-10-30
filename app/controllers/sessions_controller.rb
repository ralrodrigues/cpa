class SessionsController < ApplicationController

  def new
  end

  def create
    # usuario = Usuario.find_by(nome: params[:session][:nome])
    # if usuario && usuario.authenticate(params[:session][:senha])
    #   login usuario
    #   if usuario.tipo != 'Administrador'
    #     redirect_to usuario_respostas_path(usuario), alert: "Carregando Questionário"
    #   else 
    #     redirect_to questionarios_path, alert: "Carregando Painel de Controle"
    #   end
    # else
    #   flash.now[:error] = 'Usuário/Senha Inválidos'
    #   render 'new'
    # end
  end

  def create
    nome_de_usuario = params[:session][:nome] 
    senha = params[:session][:senha] 

    if nome_de_usuario == nil || senha == nil
      redirect_to login_path, notice: "Preencha Corretamente"
    else
      usuario = Usuario.find_by(nome: nome_de_usuario.upcase, senha: senha)
      if usuario
        login usuario    
        if usuario.tipo == "Administrador"
          redirect_to questionarios_path
        else
          redirect_to usuario_respostas_path(usuario)
        end
      else 
        redirect_to login_path, notice: "Usuário/Senha Inválidos"
      end
    end  
  end

  def destroy
    logout
    redirect_to root_url
  end
end