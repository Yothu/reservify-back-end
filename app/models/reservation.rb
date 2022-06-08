class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel

  validates :room_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
