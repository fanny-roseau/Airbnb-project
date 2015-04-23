class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :date_arrival
      t.date :date_departure
      t.integer :people_number
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
