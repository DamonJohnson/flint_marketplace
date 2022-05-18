class RemoveLocationFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :location_id
  end
end
