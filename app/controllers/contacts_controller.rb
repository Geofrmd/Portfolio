class ContactsController < ApplicationController
  # def new
  #   @contact = Contact.new
  # end

  # def create
  #   @contact = Contact.new(contact_params)


  #   if @contact.save
  #     flash.now[:success] = 'Message sent!'
  #     redirect_to root_path
  #   else
  #     flash.now[:error] = 'Could not send message'
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # private

  # def contact_params
  #   params.require(:contact).permit(:name, :entreprise, :email, :phone, :message)
  # end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = 'Message sent!'
    else
      flash.now[:error] = 'Could not send message'
      render :new
    end
  end
end
