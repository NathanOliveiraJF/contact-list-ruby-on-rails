class SessionsController < ApplicationController
  def new
    # entender esses parametros nas rotas
    redirect_to user_path(current_user) if user_signed_in?
  end

  def create 
    # fazer um teste o que vem nesse params

    user = User.find_by(email: params[:session][:email].downcase)

    # method do has_secure_password
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      # redirecionamento
      # passa  a rota show passando o usuario

      redirect_to user_path(user)
    else
      # flash.now 
      # se usar só flash vai ficar persistida por mais uma requisicao
      flash.now[:danger] = 'Email ou senha invalidos'
      # renderiza a view new
      render 'new'
    end
  end

  def destroy
    sign_out 
    flash[:success] = 'Logout realizado com sucesso'
    redirect_to entrar_path
  end

end
