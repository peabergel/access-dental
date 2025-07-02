class ContactsController < ApplicationController
  require "net/http"
  require "uri"
  require "json"

  def new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find_by(id: params[:product_id]) if params[:product_id].present?
    @contact_data = params[:contacts]

    # 🔐 Vérification Turnstile
    turnstile_response = params["cf-turnstile-response"]

    uri = URI.parse("https://challenges.cloudflare.com/turnstile/v0/siteverify")
    response = Net::HTTP.post_form(uri, {
      "secret" => ENV["TURNSTILE_SECRET_KEY"],
      "response" => turnstile_response,
      "remoteip" => request.remote_ip
    })

    result = JSON.parse(response.body)

    if result["success"]
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
      flash[:alert] = "Échec de la vérification de sécurité. Veuillez réessayer."

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
