class PagesController < ApplicationController
  def home
    @articles = Article.recents(3)
    @offers = Offer.recents(6)
    @brands_images_url = Brand.pluck(:image_url)
    @marker = { lat: 0.35384, lng: 46.56725 }
  end
end
