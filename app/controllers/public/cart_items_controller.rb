class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

 

  def index
     @cart_items = current_customer.cart_items

  end

  def create
    binding.pry
    
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end