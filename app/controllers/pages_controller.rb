class PagesController < ApplicationController
  append_view_path Rails.root.join("app/views/pages/home")

  def home
    @contact_data = session.delete(:contact_data)
    @articles = Article.ordered_by_position
    @offers = Offer.ordered_by_position
    @brands = Brand.all
    @marker = { lat: 0.27551824993099144, lng: 46.52883076502155 }
  end
end
