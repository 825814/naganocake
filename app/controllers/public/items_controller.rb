class Public::ItemsController < ApplicationController

  def index
    # @genres = Genre.all
    @all_item = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    # @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @customer = current_customer


  end


end
