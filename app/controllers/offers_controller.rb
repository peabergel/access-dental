class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to root_path, notice: "L'offre #{@offer.name} a été créée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to root_path, notice: "L'offre #{@offer.name} a été mise à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    redirect_to root_path, notice: "L'offre #{@offer.name} a été supprimée"
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :image_url, :pdf_url, :month_offer)
  end
end
