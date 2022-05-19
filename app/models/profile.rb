class Profile < ApplicationRecord
  resourcify
  belongs_to :user
  validates_associated :user

  validates :first_name, :last_name, :address, :city, :state, presence: true
  validates :postcode, numericality: { only_integer: true, greater_than: 0, less_than: 9999 }


end
 