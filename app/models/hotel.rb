class Hotel < ApplicationRecord
  has_many :reservations, dependent: :delete_all
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :room_price, presence: true, numericality: { only_decimal: true , greater_than: 0 }
  validates :number_of_rooms, presence: true ,numericality: { only_integer: true, greater_than: 10 }
  validates :stars, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :current_free_rooms, presence: true, numericality: { only_integer: true }

end
