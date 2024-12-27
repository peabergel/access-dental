class PagesController < ApplicationController
  def home
    @articles = Article.order(position: :asc).limit(3)
    @offers = Offer.order(position: :asc).limit(6)
    @brands_images_url = Brand.pluck(:image_url)
    @mapbox_api_key = ENV["MAPBOX_API_KEY"]
    @markers = [
      { lat: 0.35384, lng: 46.56725 }
    ]
  end
end
