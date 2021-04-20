class HistoryItem < ApplicationRecord
  default_scope -> { order(updated_at: :desc) }
  belongs_to :cart
  belongs_to :item
end
