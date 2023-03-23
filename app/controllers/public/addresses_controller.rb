class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end



  def create
    @address = Address.new(address_params)
    if @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
    else
    render :index
    end
  end

  def edit
    @address = current_customer.addresses.find(params[:id])

  end

  def update
    @address = current_customer.addresses.find(params[:id])
    @address.update(address_params)
      redirect_to addresses_path
  end

  def destroy
    @address = current_customer.addresses.find(params[:id])
    # byebug
    @address.destroy
      redirect_to addresses_path
  end


  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
