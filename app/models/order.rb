class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 配送準備中: 3, 配送済み: 4}
  enum address:[:"ご自身の住所", :"登録済住所から選択", :"新しいお届け先"]
  
end
