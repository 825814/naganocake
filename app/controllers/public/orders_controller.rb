class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
    @addresses = current_customer.address
  end

  # def address_display
  # '〒' + postal_code + ' ' + address + ' ' + name
  # end

  def create
    @order = Order.new(order_params)
    if @order.customer_id = current_customer.id
    @order.save
    redirect_to confirm_path
    else
    render :new
    end
  end

  def confirm
    @orders = current_customer.orders
    @total = 0
    @order = current_customer.order
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
