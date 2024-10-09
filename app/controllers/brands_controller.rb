class BrandsController < ApplicationController
  def new
    @brand = Brand.new
    @categories = Category.all
    @category_id = params[:category_id]
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to category_products_path(@brand.category), notice: "Brand was successfully created"
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
      redirect_to category_products_path(@brand.category), notice: "Brand was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    redirect_to category_products_path(@brand.category), notice: "Brand was successfully deleted"
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :position, :category_id, :image_url, :website_url, :primary_color, :secondary_color, :tertiary_color)
  end
end
