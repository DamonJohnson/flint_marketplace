class RemoveTotalFeeFromBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :total_fee, :float
  end
end
