class Reservation < ApplicationRecord
  after_create :decrease_hotel_free_rooms
  after_destroy :increase_hotel_free_rooms
  belongs_to :user
  belongs_to :hotel

  validates :room_number, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: true

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
