class PositionsController < ApplicationController
  def update
    klass = params[:klass].capitalize.constantize
    @item = klass.find(params[:item_id])

    @item.insert_at(params[:position].to_i)
    head :no_content
  end
end
