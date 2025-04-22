class ContactsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find_by(id: params[:product_id]) if params[:product_id].present?

    # Récupère les données du formulaire dans une variable @contact_data
    @contact_data = params[:contacts]

    if verify_recaptcha
      ContactMailer.send_contact(
        @contact_data[:name],
        @contact_data[:email],
        @contact_data[:phone_number],
        @contact_data[:message],
        @contact_data[:source],
        @contact_data[:mail_subject]
      ).deliver_now

      flash[:notice] = "Votre demande a bien été envoyée !"
      redirect_to root_path(anchor: "contact-form")
    else
      flash[:alert] = "Merci de confirmer que vous n'êtes pas un robot."

      if @contact_data[:source] == "contact_page" && @product.present?
        render :new
      else
        redirect_to root_path(anchor: "contact-form", contact_data: params.require(:contacts).permit(:name, :email, :phone_number, :mail_subject, :message, :source).to_h)
      end
    end
  end

  def contact_params
    params.require(:contacts).permit(:name, :email, :phone, :message, :mail_subject, :source)
  end
end
