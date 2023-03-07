class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
  end


end
