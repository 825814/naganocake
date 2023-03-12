class Address < ApplicationRecord
  has_many :customers, dependent: :destroy
  belongs_to :customer

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
