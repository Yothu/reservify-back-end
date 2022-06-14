require 'rails_helper'

RSpec.describe Hotel, type: :model do
  before :each do
    Hotel.destroy_all
    User.destroy_all
    Reservation.destroy_all

    @user = User.new(email: 'test@example.com', password: '12345678', username: 'tester', role: 'admin')
    @user.save

    @hotel = Hotel.new(name: 'Hotel', address: 'Address', city: 'City', country: 'Country', image_url: 'Image URL',
                       description: 'Description', room_price: 100, number_of_rooms: 20, stars: 5)
    @hotel.save

    @reservation = Reservation.create!(room_number: 1, user_id: @user.id, hotel_id: @hotel.id)
    @reservation.save
  end

  it 'reservation should be valid' do
    expect(@reservation).to be_valid
  end

  it 'should have a user id' do
    @reservation.user_id = nil
    expect(@reservation).to_not be_valid
  end

  it 'should have a hotel id' do
    @reservation.hotel_id = nil
    expect(@reservation).to_not be_valid
  end  

  it 'should have a user id that is a number' do
    @reservation.user_id = 'a'
    expect(@reservation).to_not be_valid
  end

  it 'should have a user id that is greater than 0' do
    @reservation.user_id = 0
    expect(@reservation).to_not be_valid
  end

  it 'should have a hotel id that is a number' do
    @reservation.hotel_id = 'a'
    expect(@reservation).to_not be_valid
  end

  it 'should have a hotel id that is greater than 0' do
    @reservation.hotel_id = 0
    expect(@reservation).to_not be_valid
  end
  
end
