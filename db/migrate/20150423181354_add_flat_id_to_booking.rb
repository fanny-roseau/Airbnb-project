class AddFlatIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :flat_id, :integer
  end
end
