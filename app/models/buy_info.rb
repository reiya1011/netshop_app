class BuyInfo < ApplicationRecord
  default_scope -> { order(updated_at: :desc) }
  belongs_to :item
  belongs_to :u_info
  
  validates :item, presence: true
  validates :u_info, presence: true
end
