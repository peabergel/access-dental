class ProductsController < ApplicationController
  before_action :set_category, only: [ :new, :create ]

  def new
    @product = Product.new
    @brands = Brand.sorted_by_name
  end

  def create
    @product = Product.new(product_params)
    @product.category = @category
    if @product.save
      redirect_to category_path(@category), notice: "#{@product.name} à bien été crée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to category_path(@product.category), notice: "#{@product.name} à bien été mis à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to category_path(@product.category), notice: "#{@product.name} à bien été supprimé"
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:name, :position, :description, :image_url, :pdf_url, :category_id, :brand_id)
  end
end
