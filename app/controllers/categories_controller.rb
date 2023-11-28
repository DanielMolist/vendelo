class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(name: :asc)
  end

  def new
    @category = Category.new
  end

  def edit
    category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if category.update(category_params)
      redirect_to categories_path, notice: t(".updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    category.destroy
    redirect_to categories_path, notice: t(".destroyed"), status: :see_other #para evitar un 302 automatico y que falle turbo le pasamos un 303.
  end

  private

  def category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
