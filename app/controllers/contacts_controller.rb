class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.contact_email(@contact).deliver_now && ContactMailer.contact_response(@contact).deliver_now
      flash[:notice] = '<strong>Message sent!</strong>'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
