class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  has_many :cart_quantity, dependent: :destroy
  has_many :quantity, through: :cart_quantity, source: :quantity
end
