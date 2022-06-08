class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.float :room_price
      t.boolean :pet_friendly
      t.integer :number_of_rooms
      t.integer :stars
      t.integer :current_free_rooms
      t.timestamps
    end
  end
end
