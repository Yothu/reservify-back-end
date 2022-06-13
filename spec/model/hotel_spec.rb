require 'rails_helper'

RSpec.describe Hotel, type: :model do
  before :all do
    @hotel = Hotel.new(name: 'Hotel', address: 'Address', city: 'City', country: 'Country', image_url: 'Image URL',
                       description: 'Description', room_price: 100, number_of_rooms: 20, stars: 5)
    @hotel.save!
  end

  it 'a hotel should be valid' do
    expect(@hotel).to be_valid
  end

  it 'should have a name' do
    @hotel.name = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have an address' do
    @hotel.address = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have a city' do
    @hotel.city = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have a country' do
    @hotel.country = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have an image url' do
    @hotel.image_url = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have a description' do
    @hotel.description = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have a room price' do
    @hotel.room_price = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have a number of rooms' do
    @hotel.number_of_rooms = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have a stars' do
    @hotel.stars = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have a current free rooms' do
    @hotel.current_free_rooms = nil
    expect(@hotel).to_not be_valid
  end

  it 'should have a current free rooms equal to number of rooms' do
    expect(@hotel.current_free_rooms).to eq(@hotel.number_of_rooms)
  end
end
