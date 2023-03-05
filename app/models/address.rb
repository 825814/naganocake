class Address < ApplicationRecord
  has_many :customers, dependent: :destroy
  belongs_to :customer
end
