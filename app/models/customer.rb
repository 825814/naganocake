class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :address
  belongs_to :cart_item
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
