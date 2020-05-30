class CustomerProductsController < ApplicationController
    before_action :set_customer_product, only: %i[edit update destroy]

  def index
    @customer_products = CustomerProduct.where(params[:customer_id])
  end

  def new
  end

  def create
    @customer_product = CustomerProduct.new(params_customer_product)
    @customer = Customer.find(params[:customer_id])
    @customer_product.customer = @customer
  if @customer_product.save
    redirect_to customer_path(@customer)
  else
    render :new
  end
  end

  def edit
  end

  def update
  @customer = Customer.find(params[:customer_id])
   @customer_product.update(params_customer_product)
   redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @customer_product.destroy
    redirect_to customer_path(@customer)
  end

private
  def set_customer_product
    @customer_product = CustomerProduct.find(params[:id])
  end

  def params_customer_product
    params.require(:customer_product).permit(:quantity, :product_id, :customer_id)
  end
end
