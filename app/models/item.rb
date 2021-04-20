class Item < ApplicationRecord
    has_one :item_info, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :cart_item, dependent: :destroy
    has_many :history_item, dependent: :destroy
    has_many :buy_info, dependent: :destroy
    has_many :item_quantity, dependent: :destroy
    has_many :info, through: :item_info, source: :info
    has_one_attached :image
    has_many_attached :images, dependent: :destroy

    
    validates :name, presence: true
    validates :content, presence: true
    validates :price, presence: true
    validates :stocks, presence: true
    validates :gender, presence: true
    validates :category, presence: true
    
    validate  :images_length

    
    private
    
    def self.search(search)
      Item.where(['name LIKE ?', "%#{search}%"])
    end
    
    def images_length
      if images.length > 4
        errors.add(:images, "は4枚以内にしてください")
      end
    end
end
