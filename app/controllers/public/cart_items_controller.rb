class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
     @cart_items = current_customer.cart_items
    
  end

  # def create



end
