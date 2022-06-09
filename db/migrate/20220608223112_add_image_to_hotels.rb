class AddImageToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :image_url, :string
  end
end
