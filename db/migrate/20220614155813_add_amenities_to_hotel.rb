class AddAmenitiesToHotel < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :public_pool, :boolean, default: false
    add_column :hotels, :wifi, :boolean, default: false
    add_column :hotels, :air_conditioning, :boolean, default: false
  end
end
