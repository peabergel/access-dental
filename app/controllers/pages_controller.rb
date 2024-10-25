class PagesController < ApplicationController
  def home
    @categories = Category.all
    @articles = Article.order(created_at: :desc).limit(3)
  end
end
