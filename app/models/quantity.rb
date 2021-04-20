class Quantity < ApplicationRecord
   has_many :item_quantity, dependent: :destroy
   has_many :cart_quantity, dependent: :destroy
end
