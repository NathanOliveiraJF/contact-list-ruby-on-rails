class UsersController < ApplicationController

  def new 
    @user = User.new
  end

  def create    
    # tras os paranemtnos da requisicao(body)
    @user = User.new(user_params)
    # TODO entender como é por tras da ORM ActiveRecord
    # TODO pesquisar criação de api com rails
    # TODO o que é haml
    # TODO entender melhor as syntax das funcoes
    if @user.save
      # flash => envia menagem para o usuario
      flash[:success] = 'Usuário cadatrado com sucesso'
      # redireciona o usuario para a pagina root(index)
      redirect_to root_url
    else
      # redireciona o usuario para a pagina de cadastro novamente
      render 'new'
    end
  end

  # padrao do ruby
  private def user_params 
    # garante que apenas esses paramentos sao inseridos no usuario
    params.require(:user).permit(:email, :nome, :password, :password_confirmation)
    # TODO pesquisar como realizar esses processo de forma manual 
    # TODO como é a função params
  end
end
