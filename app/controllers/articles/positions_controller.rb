class Articles::PositionsController < ApplicationController
  def update
    @article = Article.find(params[:article_id])

    @article.insert_at(params[:position].to_i)
    head :no_content
  end
end
