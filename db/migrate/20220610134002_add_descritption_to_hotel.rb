class AddDescritptionToHotel < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :description, :text
  end
end
