class UpdateForeignKey < ActiveRecord::Migration[7.0]
  def change
     # remove the old foreign_key
    remove_foreign_key :users, :locations

    # add the new foreign_key
    add_foreign_key :users, :locations, on_delete: :cascade
  end
end
