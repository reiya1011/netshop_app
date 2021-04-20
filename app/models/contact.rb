class Contact < ApplicationRecord
    default_scope -> { order(updated_at: :desc) }
    validates :email, presence: true
    validates :subject, presence: true
    validates :contents, presence: true
end
