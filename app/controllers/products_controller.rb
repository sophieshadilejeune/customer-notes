class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]

  def index
    @user = current_user
    @products = @user.products
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
    @product.user = current_user
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(params_product)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

    private

  def set_product
    @product = Product.find(params[:id])
  end

  def params_product
    params.require(:product).permit(:name, :user_id)
  end
end


