class Item < ApplicationRecord
    resourcify
    belongs_to :category
    belongs_to :user
    has_many :bookings

    has_one_attached :image

end 
 