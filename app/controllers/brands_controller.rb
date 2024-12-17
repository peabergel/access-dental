class BrandsController < ApplicationController
  def new
    @brand = Brand.new
    @categories = Category.all
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to category_products_path(@brand.categories.first), notice: "#{@brand.name} à bien été crée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      redirect_to category_products_path(@brand.categories.first), notice: "#{@brand.name} à bien été mis à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    redirect_to category_products_path(@brand.category), notice: "#{@brand.name} à bien été supprimé"
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :position, :image_url, :website_url, :primary_color, :secondary_color, category_ids: [])
  end
end
