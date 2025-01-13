class ContactMailer < ApplicationMailer
  default from: ENV["ACCESS_DENTAL_USERNAME"]

  def send_contact(name, email, phone, message, source, mail_subject)
    @name = name
    @sender_email = email
    @phone_number = phone
    @message = message
    @source = source
    @mail_subject = mail_subject

    mail(
      to: ENV["ACCESS_DENTAL_USERNAME"],
      subject: @mail_subject
    )
  end
end
