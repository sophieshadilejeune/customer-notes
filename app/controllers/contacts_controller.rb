class ContactsController < ApplicationController

  def new
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new(params_contact)
    @contact.customer = @customer
    @contact.save
    redirect_to customer_path(@customer)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_contact
    params.require(:contact).permit(:name, :email, :phone_number, :customer_id)
  end
end
