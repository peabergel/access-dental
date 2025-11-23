class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path, notice: "#{@article.title} à bien été créé"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to root_path, notice: "#{@article.title} à bien été modifié"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, notice: "#{@article.title} à bien été supprimé"
  end

  private

  def article_params
    params.require(:article).permit(:title, :image_url, :pre_content, :content, :pdf_url)
  end
end
