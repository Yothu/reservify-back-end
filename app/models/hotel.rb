class Hotel < ApplicationRecord
  before_create :set_current_free_rooms
  has_many :reservations, dependent: :delete_all
  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :description, presence: true
  validates :room_price, presence: true, numericality: { only_decimal: true, greater_than: 0 }
  validates :stars, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }

  private

  def set_current_free_rooms
    self.current_free_rooms = number_of_rooms
  end
end
