class PagesController < ApplicationController
  before_action :check_admin, only: :dashboard

  def home
  end

  def dashboard
    @new_contacts = Contact.order(created_at: :desc).limit(10)
  end

  private

  def check_admin
    unless current_user&.admin?
      # Redirige vers une page d'erreur ou une autre page appropriée pour les utilisateurs non-administrateurs
      redirect_to root_path, alert: "Accès restreint. Vous devez être administrateur pour accéder à cette page."
    end
  end
end
