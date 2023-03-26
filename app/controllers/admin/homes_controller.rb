class Admin::HomesController < ApplicationController

 def top
   # @orders = Order.all
   # ページネーション
   @orders = Order.page(params[:page])

 end

end


