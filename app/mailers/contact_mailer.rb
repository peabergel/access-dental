class ContactMailer < ApplicationMailer
  default from: "contact@access-dental.com"

  def send_contact(name, email, phone, message, source, mail_subject)
    @name = name
    @sender_email = email
    @phone_number = phone
    @message = message
    @source = source
    @mail_subject = mail_subject

    mail(
      to: "contact@access-dental.com",
      subject: @mail_subject
    )
  end
end
