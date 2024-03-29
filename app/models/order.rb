class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  #enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 配送準備中: 3, 配送済み: 4}
  enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4}

 
  def subtotal
    price * amount
  end

end
