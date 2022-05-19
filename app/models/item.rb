class Item < ApplicationRecord
    resourcify
    belongs_to :category
    belongs_to :user
    has_many :bookings

    has_one_attached :image

    validates :title, :description, :category, :price, :image, presence: true
    validates :price, comparison: { greater_than: 0}
end 
 