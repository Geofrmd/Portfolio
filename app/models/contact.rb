class Contact < ApplicationRecord
  validates :phone, format: { with: /\A(\+33|0)[1-9](\d{2}){4}\z/, message: "Numéro de téléphone invalide" }, numericality: { only_integer: true }, allow_blank: true
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Adresse e-mail invalide" }
  validates :message, presence: true
end
