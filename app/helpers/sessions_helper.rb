module SessionsHelper
   def sign_in(:user_id) 
    # variavel session, disponibiliza session do browser
    # tipo um hash, cria chave => valor
    # guarda usuario na session
    session[:user_id] = user_id
   end

   def sign_out
    # apaga a session do usuario
    session.delete(:user_id)
   end

   # normalmente usado no ruby, algumas gems usam
   def current_user 
    # ||= se a variavel ja for setada, nao faz a query 
    # se for nil ele seta, fazendo a query

    @current_user ||= User.find_by(id: session[:user_id])
   end

   # se nn for nil retorna true, se n retorna false

   def user_signed_in?
    !current_user.nil?
   end
end
