class HotelSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :city, :country, :room_price, :pet_friendly, :number_of_rooms,
             :stars, :current_free_rooms, :photo_url, :user_id
end
