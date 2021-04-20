class UInfo < ApplicationRecord
   validates :name, presence: true
   validates :phone_number, presence: true
   validates :postal_code, presence: true
   validates :prefectures, presence: true
   validates :municipal_district, presence: true
   validates :street_bunch, presence: true
     
   has_many :shopping_info, dependent: :destroy
   has_many :user_info, dependent: :destroy
   has_many :buy_info, dependent: :destroy
   has_many :in_item, through: :buy_info, source: :item 
end
