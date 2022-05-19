class Booking < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :item

  validates :start_date, comparison: { less_than: :end_date }
end
