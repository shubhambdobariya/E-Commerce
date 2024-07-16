class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      flash[:success] = "Category was successfully created."
      redirect_to @category
    else
      flash.now[:error] = "There was an error creating the Category."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:success] = "Category was successfully updated."
      redirect_to @category
    else
      flash.now[:error] = "There was an error updating the Category."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
