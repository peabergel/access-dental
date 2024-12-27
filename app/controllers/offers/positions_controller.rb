class Offers::PositionsController < ApplicationController
  def update
    @offer = Offer.find(params[:offer_id])

    @offer.insert_at(params[:position].to_i)
    head :no_content
  end
end
