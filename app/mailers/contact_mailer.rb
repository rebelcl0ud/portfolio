class ContactMailer < ApplicationMailer
  #default from: 'no-reply@whateverhere.com'

  def contact_email(contact)
    @contact = contact
    mail(to: "rebelcl0udmedia@gmail.com",
         from: @contact.email,
         subject: "Contact Form", 
         message: @contact.message)
  end
end
