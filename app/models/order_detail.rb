class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

   #enum making_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}
   enum making_status: { production_not_possible: 0, production_pending: 1, in_production: 2,  production_complete: 3}



   def subtotal
    price * amount
   end
end
