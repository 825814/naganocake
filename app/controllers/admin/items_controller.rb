class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
    
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
  end



end