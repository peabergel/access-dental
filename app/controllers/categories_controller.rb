class CategoriesController < ApplicationController
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]
  def new
    @category = Category.new
  end

  def show
    @brands = if params[:brand]
      @category.brands.where(name: params[:brand]).ordered
    else
      @category.brands.ordered
    end

    @category_parent = @category.parent if @category.parent_id
    @brands_names = @category.brands.pluck(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path, notice: "Category was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to root_path, notice: "Category was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy

    redirect_to root_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.expect(category: [ :name, :image_url ])
  end
end
