class PagesController < ApplicationController
  def home
    @category_names = Category.pluck(:name)
  end
end
