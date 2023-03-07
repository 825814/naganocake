class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!



  def index
     @cart_items = current_customer.cart_items

  end

  def create
    binding.pry
    @item = Item.find(cart_item_params[:item_id])
    
  end

　def destroy
　  cart_item = CartItem.find(params[:id])
　  cart_item.destroy
　  redirect_to cart_items_path
　end
　
　def destroy_all
　  customer = current_customer
　  customer.cart_items.destroy_all
　  redirect_to cart_items_path
　end
　  
　 
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end