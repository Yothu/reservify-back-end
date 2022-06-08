class Api::V1::HotelsController < ApplicationController

  # load_and_authorize_resource


  def index
    @hotels = Hotel.all
    render json: @hotels
  end  

  def show
    @hotel = Hotel.find(params[:id])
    render json: @hotel
  end



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

 

  def update
    if @hotel.update(hotel_params)
      render json: { message: 'Hotel was successfully updated.' }
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

 

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
