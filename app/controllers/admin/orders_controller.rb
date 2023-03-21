class Admin::OrdersController < ApplicationController
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order_detail.id)
    
  end
end
