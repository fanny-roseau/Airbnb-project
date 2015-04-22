class AddUserIdToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :user_id, :string
  end
end
