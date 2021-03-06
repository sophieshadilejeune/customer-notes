class CustomersController < ApplicationController

  def index
    @user = current_user
    @folders = @user.folders
    @customers = @user.customers
    @customers_geo = @customers.geocoded
    @customers_for_geo = @customers_geo.where.not(latitude: nil, longitude: nil)
    @markers = @customers_for_geo.map do |customer|
      {
        lat: customer.latitude,
        lng: customer.longitude,
        infowindow: render_to_string(partial: "../views/shared/info_window", locals: { customer: customer })
      }
    end
  end

  def show
    @user = current_user
    @customer = Customer.find(params[:id])
    if !@customer.latitude.nil? && !@customer.longitude.nil?
    @customer_geo = []
    @customer_geo << @customer
    @markers = @customer_geo.map do |customer|
      {
        lat: customer.latitude,
        lng: customer.longitude,
        infowindow: render_to_string(partial: "../views/shared/info_window", locals: { customer: customer })
      }
    end
  end
    @customer_products = @customer.customer_products
  end

  def new
    @user = current_user
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
    @user = current_user
    @customer = Customer.find(params[:id])
  end

  def update
  @customer = Customer.find(params[:id])
   @customer.update(params_customer)
   redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  def edit_notes
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def edit_products
    @customer = Customer.find(params[:id])
    @customer_products = @customer.customer_products
    @customer_product = CustomerProduct.new
    # respond_to do |format|
    #   format.js
    # end
  end

  def add_contact
    @customer = Customer.find(params[:id])
    @contacts = @customer.contacts
    @contact = Contact.new
    # respond_to do |format|
    #   format.js
    # end
  end

  def edit_contact
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

  def params_customer
    params.require(:customer).permit(:address, :contact_number, :folder_id, :notes, :company_name, :contact_name, :website, :email, photos: [])
  end
end
