class User < ApplicationRecord
  # cria um hash da senha
  # cria dois atributos virtuais password e password_confirmation
  has_secure_password 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # validacoes
  # validates => método de validacao de modulo
  # presence => obrigatorio
  # length => maximo de caracteres
  # case_sensetive => checa se a string está com caixa alta, caixa baixa

  validates :nome, presence: true, length: { maximum: 50}
  validates :password, length: { maximum: 6 }
  validates :email, presence: true, 
    length: {maximum: 255}, 
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensetive: true }

  # usuario tem mts contatos, associação
  has_many :contacts
end
