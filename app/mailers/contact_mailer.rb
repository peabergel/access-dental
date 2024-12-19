class ContactMailer < ApplicationMailer
  default from: "pe.abergel@gmail.com"

  def send_contact(name, email, phone, message, source, mail_subject)
    @name = name
    @sender_email = email
    @phone_number = phone
    @message = message
    @source = source
    @mail_subject = mail_subject

    mail(
      to: "pe.abergel@gmail.com",
      subject: "#{@mail_subject}"
    )
  end
end
