class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :bookings, dependent: :destroy
  
  
  # New method for default roles has been implemented in create actions
  # def assign_owner_role
  #   if self.roles.blank? && self.items != nil 
  #     self.add_role :owner, Item.where(user_id: self.id)
  #   end
  # end

  # def assign_admin_role
  #   if self.email = 'flint@admin.com'
  #     self.add_role :admin
  #   end
  # end

end
