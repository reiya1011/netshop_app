class CartQuantity < ApplicationRecord
   belongs_to :cart_item
   belongs_to :quantity
end
