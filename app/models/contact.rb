# class Contact < ApplicationRecord
#   validates :phone, format: { with: /\A(\+33|0)[1-9](\d{2}){4}\z/, message: "Numéro de téléphone invalide" }, numericality: { only_integer: true }, allow_blank: true
#   validates :name, presence: true
#   validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Adresse e-mail invalide" }
#   validates :message, presence: true
# end

class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\z/
  attribute :message, validate: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Formulaire de contact - geoffroy-moreaud.com",
      :to => "g.moreaud@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
