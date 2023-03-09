class CartItem < ApplicationRecord
  # has_many :items, dependent: :destroy
  # has_many :customers, dependent: :destroy
  belongs_to :item
  belongs_to :customer, optional: true

  def subtotal
    item.with_tax_price * amount
  end

end
