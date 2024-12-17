class ContactMailer < ApplicationMailer
  default from: 'pe.abergel@gmail.com'

  def send_contact
    @name = params[:name]
    @message = params[:message]
    @sender_email = params[:email]
    @phone_number = params[:phone_number]
    @mail_subject = params[:mail_subject]

    mail(
      to: 'pe.abergel@gmail.com',
      subject: "#{@mail_subject}"
    )
  end
end
