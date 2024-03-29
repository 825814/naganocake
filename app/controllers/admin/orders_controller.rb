class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    # @order_details = OrderDetail.all
    #@order_details = Order.where(id: params[:id])
    #@order_details = OrderDetail.find(params[:id])
  end

  # def show
  #   @order = Order.find(params[:id])
  #   @order_details = OrderDetail.all
  # end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order.id)

  end

  private

    def order_params
      params.require(:order).permit(:status)
    end


end
