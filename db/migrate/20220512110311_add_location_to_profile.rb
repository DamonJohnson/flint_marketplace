class AddLocationToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :address, :string
    add_column :profiles, :city, :string
    add_column :profiles, :postcode, :integer
    add_column :profiles, :state, :string
  end
end
