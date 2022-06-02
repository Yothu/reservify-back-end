class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
       t.date :check_in_date
       t.date :check_out_date
       
      t.timestamps
    end
  end
end
