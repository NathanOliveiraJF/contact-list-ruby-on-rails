class Contact < ApplicationRecord
  # busca os atributos do schema

  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true

  # pertence ao usuario
  # associação
  
  belongs_to :user
end
