class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = current_customer.orders.new
    # @address = Address.new
    # @customer = current_customer
    #@addresses = current_customer.addresses
  end



  def create
    order_details = current_customer.order_details
    @order = current_customer.orders.new(order_params)
   # @order = Order.new(order_params)
    #@order.customer_id = current_customer.id

    # binding.pry
    if @order.save


      order_details.each do |order_detail|
        order_detail = Orderdetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.item.name = cart_item.item.name
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.price
        order_detail.save
      end

    redirect_to complete_path
    order_details.destroy_all

    else
      @order = Order.new
      render :new
    end

  end

  def confirm

    @orders = current_customer.orders

    @order = Order.new(order_params)
    # binding.pry

    if params[:order][:select_address] == "0"

    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"

    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name

  else

    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]


    end
     @total = 0
     @cart_items = current_customer.cart_items.all
    # @order.shipping_cost = 800
    # @total += cart_item.subtotal
    # @order.total_payment = @total + @order.shipping_cost
  end

  # def subtotal
  #   item.with_tax_price * amount
  # end


  def index
    @orders = current_customer.orders
    # byebug
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @toral = 0

  end

private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    #params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

end
