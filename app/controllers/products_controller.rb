class ProductsController < ApplicationController
  before_action :set_brand, only: [:new, :create, :edit, :update]

  def index
    @category = Category.find(params[:category_id])
    @products = @category.products
    @brands = @category.brands
  end

  def new
    @product = Product.new
    @category = Category.find(params[:category_id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "#{@product.name} à bien été crée"
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
      redirect_to category_products_path(@product.category), notice: "#{@product.name} à bien été mis à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to category_products_path(@product.category), notice: "#{@product.name} à bien été supprimé"
  end

  private

  def product_params
    params.require(:product).permit(:name, :position, :description, :image_url, :pdf_url, :category_id, :brand_id)
  end

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end
end
