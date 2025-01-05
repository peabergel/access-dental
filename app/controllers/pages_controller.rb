class PagesController < ApplicationController
  append_view_path Rails.root.join("app/views/pages/home")

  def home
    @articles = Article.ordered_by_position
    @offers = Offer.ordered_by_position
    @brands_images_url = Brand.pluck(:image_url)
    @marker = { lat: 0.35384, lng: 46.56725 }
  end
end
