class ShoppingInfo < ApplicationRecord
  belongs_to :cart
  belongs_to :u_info
end
