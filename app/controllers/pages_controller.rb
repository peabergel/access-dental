class PagesController < ApplicationController
  def home
    @categories = Category.all
    @articles = Article.order(created_at: :desc).limit(3)
    @offers = Offer.order(created_at: :desc).limit(6)
    @brands_images_url = Brand.pluck(:image_url)
    @mapbox_api_key = ENV["MAPBOX_API_KEY"]
    @markers = [
      { lat: 0.35384, lng: 46.56725 }
    ]
  end
end
