class CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @customers_geo = Customer.geocoded

    @markers = @customers_geo.map do |customer|
      {
        lat: customer.latitude,
        lng: customer.longitude,
        infoWindow: render_to_string(partial: "../views/shared/info_window", locals: { customer: customer })
      }
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @customer_geo = []
    @customer_geo << @customer
    @markers = @customer_geo.map do |customer|
      {
        lat: customer.latitude,
        lng: customer.longitude,
        infoWindow: render_to_string(partial: "../views/shared/info_window", locals: { customer: customer })
      }
    end
    @customer_products = CustomerProduct.where(customer_id: @customer.id)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params_customer)
    @customer.user = current_user
    if @customer.save
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  @customer = Customer.find(params[:id])
   @customer.update(params_customer)
   redirect_to customer_path(@customer)
  end

  def destroy
  end

  def edit_notes
  @customer = Customer.find(params[:id])
  respond_to do |format|
    format.js
  end
  end

  def edit_products
  @customer = Customer.find(params[:id])
  @customer_products = CustomerProduct.where(customer_id: @customer.id)
  @customer_product = CustomerProduct.new
  respond_to do |format|
    format.js
  end
  end

  private

  def params_customer
    params.require(:customer).permit(:address, :contact_number, :folder_id, :notes, :company_name, :contact_name, :website, :email, photos: [])
  end
end
