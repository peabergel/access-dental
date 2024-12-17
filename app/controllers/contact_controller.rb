class ContactController < ApplicationController
  def new
    # Page pour afficher le formulaire
  end

  def create
    # Récupérer les données du formulaire
    @name = params[:contact][:name]
    @email = params[:contact][:email]
    @message = params[:contact][:message]
    @phone_number = params[:contact][:phone_number]
    @mail_subject = params[:contact][:mail_subject]

    # Envoyer l'email
    ContactMailer.with(name: @name, email: @email, message: @message, phone_number: @phone_number, mail_subject: @mail_subject).send_contact.deliver_now

    flash[:notice] = "Votre demande a bien été envoyée !"
    redirect_to root_path
  end
end
