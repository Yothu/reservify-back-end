class Reservation < ApplicationRecord
  after_create :decrease_hotel_free_rooms
  after_destroy :increase_hotel_free_rooms
  belongs_to :user
  belongs_to :hotel

  private

  def decrease_hotel_free_rooms
    hotel.current_free_rooms -= 1
    hotel.save
  end

  def increase_hotel_free_rooms
    hotel.current_free_rooms += 1
    hotel.save
  end
end
