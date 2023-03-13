class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = current_customer.orders.new
    # @address = Address.new
    # @customer = current_customer
    #@addresses = current_customer.addresses
  end



  def create
    @order = current_customer.orders.new(order_params)

    @order.save
    redirect_to confirm_path
    # else
    # render :new
    # end
  end

  def confirm
    @orders = current_customer.orders
    @total = 0
    binding.pry
    @order = Order.new(order_params)
    
    if params[:order][:select_addres] == 0
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.postal_code
    @order.name = current_customer.first_name + current_customer.last_name
    
    else params[:order][:select_addres] == 1
     
    end
    
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @orders = current_customer.orders
    @toral = 0
  end

private

def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
end

end
