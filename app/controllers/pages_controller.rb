class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
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

end
