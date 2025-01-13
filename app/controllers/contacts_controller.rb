class ContactsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
  end

  def create
    # Récupérer les données du formulaire
    @name = params[:contacts][:name]
    @email = params[:contacts][:email]
    @message = params[:contacts][:message]
    @phone_number = params[:contacts][:phone_number]
    @mail_subject = params[:contacts][:mail_subject]
    @source = params[:contacts][:source]

    # Envoyer l'email
    ContactMailer.send_contact(@name, @email, @phone_number, @message, @source, @mail_subject).deliver_now

    flash[:notice] = "Votre demande a bien été envoyée!"
    redirect_to root_path
  end

  def contact_params
    params.require(:contacts).permit(:name, :email, :phone, :message, :mail_subject, :source)
  end
end
