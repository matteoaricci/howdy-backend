class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.string :topic
      t.integer :owner_id
      t.timestamps
    end
  end
end
