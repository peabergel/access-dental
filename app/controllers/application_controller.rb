class ApplicationController < ActionController::Base
  before_action :set_categories
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def set_categories
    @categories = Category.all
  end
end
