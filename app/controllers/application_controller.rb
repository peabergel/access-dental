class ApplicationController < ActionController::Base
  before_action :set_categories_and_current_category

  private

  def set_categories_and_current_category
    @categories = Category.parents.includes(:children)
    if params[:category_id]
      @current_category = Category.find(params[:category_id])
      @current_category_parent = @current_category.parent if @current_category.parent_id
    end
  rescue => e
    Rails.logger.error "Error setting current category: #{e.message}"
  end
end
