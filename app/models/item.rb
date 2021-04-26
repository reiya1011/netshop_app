class Item < ApplicationRecord
  
    has_many :likes, dependent: :destroy
    has_many :cart_item, dependent: :destroy
    has_many :history_item, dependent: :destroy
    has_many :buy_info, dependent: :destroy
    has_one_attached :image
    has_many_attached :images, dependent: :destroy

    
    validates :name, presence: true
    validates :content, presence: true
    validates :price, presence: true
    validates :stocks, presence: true
    validates :gender, presence: true
    validates :category, presence: true
    
    private
    
    def self.search(search)
      Item.where(['name LIKE ?', "%#{search}%"])
    end
    
  
end
