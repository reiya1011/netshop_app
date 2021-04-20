class ItemQuantity < ApplicationRecord
  belongs_to :item
  belongs_to :quantity
end
