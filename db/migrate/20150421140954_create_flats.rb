class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :property_type
      t.string :room_type
      t.integer :capacity
      t.string :city
      t.text :presentation
      t.integer :price
      t.string :street
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
