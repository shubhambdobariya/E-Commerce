class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @last_product_created_cookie = cookies[:last_product_created]
    p @last_product_created_cookie
    @last_product_created_session = session[:last_product_created]
    p @last_product_created_session
    @products = ProductSearchService.new(params).call
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      SendProductCreationEmailJob.perform_later(current_user.id, @product.id)
      cookies[:last_product_created] = { value: @product.price, expires: 1.hour.from_now }
      session[:last_product_created] = @product.title
      flash[:success] = "Product was successfully created."
      redirect_to @product
    else
      flash.now[:error] = "There was an error creating the product."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = @product.comments.build
    @product_presenter = ProductPresenter.new(@product)
  end
  
  def edit
    # You may add any specific logic for the edit action here if needed
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product was successfully updated."
      redirect_to @product
    else
      flash.now[:error] = "There was an error updating the product."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "Product was successfully deleted."
      cookies.delete(:last_product_created)
      session.delete(:last_product_created)
    else
      flash[:error] = "There was an error deleting the product."
    end
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :compare_at_price, :price, :category_id)
  end

  def set_product
    @product = Product.friendly.find(params[:id])
  end
end
