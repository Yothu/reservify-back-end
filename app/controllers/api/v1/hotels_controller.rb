class HotelsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  api :GET, '/hotels', 'List of all available hotels'

  def index
    @hotels = Hotel.all
    render json: @hotels
  end

  api :GET, '/hotels/id', 'Shows hotel for a given id'

  def show
    @hotel = Hotel.find(params[:id])
    render json: @hotel
  end

  api :POST, '/hotels', 'Add a new hotel to the database'

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      render json: { message: 'Hotel was successfully created.' }
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/hotels/id', 'Update hotel for a given id'

  def update
    if @hotel.update(hotel_params)
      render json: { message: 'Hotel was successfully updated.' }
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, '/hotels/id', 'Delete hotel for a given id'

  def destroy
    @hotel.destroy

    if @hotel.destroy
      render json: { message: 'Hotel was successfully destroyed.' }
    else
      render json: { message: 'Something went wrong.' }
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :city, :country, :room_price, :pet_friendly, :number_of_rooms,
                                  :stars, :current_free_rooms, :user_id)
  end
end
