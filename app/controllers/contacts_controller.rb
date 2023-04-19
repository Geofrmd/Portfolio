class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Votre message a été envoyé avec succès."
      redirect_to root_path
    else
      flash[:error] = "Erreur lors de l'envoi du message."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :entreprise, :email, :phone, :message)
  end
end
