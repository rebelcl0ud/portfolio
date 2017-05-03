class ContactMailer < ApplicationMailer
  default from: 'no-reply@jo.herokuapp.com'

  def contact_email(contact)
    @contact = contact
    mail(to: ENV['GMAIL_ADDRESS'],
         subject: "Contact Form", 
         message: @contact.message)
  end

  def contact_response(contact)
    @contact = contact
    mail(to: @contact.email, 
         subject: "Contact Form -- Greetings")
  end
end
