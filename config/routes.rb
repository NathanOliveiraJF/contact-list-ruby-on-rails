Rails.application.routes.draw do
  get 'sessions/new'
  # utiliza padrao de arquitetura rest
  # ja cria todas as rotas padrao 
  # TODO entender essa funcionalidade resources
  # TODO pesquisar como fazer desenvolvido web sem o rails
  resources :contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resource cria as rotas rest 
  # only define as rotas rest o user vai poder acessar
  resources :users, only: [:new, :create, :show]

  # Defines the root path route ("/")
  # root "articles#index"
  
  # paginas estaticas => nao tem crud
  root to: "static_pages#index"

  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  get 'sair', to: 'sessions#destroy'

end
