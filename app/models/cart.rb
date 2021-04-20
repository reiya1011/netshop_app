class Cart < ApplicationRecord
  has_many :cart_item, dependent: :destroy
  has_many :in_item, through: :cart_item, source: :item
  has_many :shopping_info, dependent: :destroy
  has_many :history_item, dependent: :destroy
  has_many :history, through: :history_item, source: :item
  has_many :u_info, through: :shopping_info, source: :u_info
end
