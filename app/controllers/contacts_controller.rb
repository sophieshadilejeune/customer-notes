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
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @customer = Customer.find(params[:customer_id])
    @contact.update(params_contact)
    redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to customer_path(@customer)
  end

  private

  def params_contact
    params.require(:contact).permit(:name, :email, :phone_number, :customer_id)
  end
end
