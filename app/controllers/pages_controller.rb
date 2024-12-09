class PagesController < ApplicationController
  def home
    @categories = Category.all
    @articles = Article.order(created_at: :desc).limit(3)
    @offers = Offer.order(created_at: :desc).limit(6)
  end
end
