class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    # @items = Item.all
    @items = Item.limit(4)
  end
end
