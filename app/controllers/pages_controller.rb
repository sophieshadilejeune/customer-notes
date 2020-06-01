class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
    @user = current_user
    if (@user.folders.count > 0) && (@user.customers.count > 0) && (@user.customer_products.count > 0)
      redirect_to customers_path
    end
  end
  end

  def map
    @customers_geo = Customer.geocoded
    @markers = @customers_geo.map do |customer|
      {
        lat: customer.latitude,
        lng: customer.longitude,
        infoWindow: render_to_string(partial: "../views/shared/info_window", locals: { customer: customer })
      }
    end
  end

  def search
    @user = current_user
    @customers = @user.customers
    @products = @user.products
    @customer_products = @user.customer_products
    if params[:query_customer].present?
      @results = @customers.search_for_customer(params[:query_customer])
      if !@results.empty?
        @customers = @results
      else
        @message = "Couldn't find any result"
      end

    elsif params[:query_product].present?
      @results = @user.products.search_for_product(params[:query_product])
        @customer_products = []
        @results.each do |result|
          @customer_products << @user.customer_products.where(product_id: result.id)
        end
        @customer_products.flatten!
      if !@customer_products.empty?
        @customers = []
        @customer_products.each do |product|
          @customers << @customers.where(id: product.customer_id)
        end
        @customers.flatten!
      else
        @message = "Couldn't find any result"
      end
    else
      @customers = @user.customers
    end
  end
end
