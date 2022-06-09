class Api::V1::HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    render json: @hotels
  end

  def latest
    @hotel = Hotel.all
    render json: @hotel, methods: [:photo_url]
  end

  def show
    @hotel = Hotel.find(params[:id])
    render json: @hotel
  end

  def hotels_by_location
    @hotels = Hotel.where(city: params[:city], country: params[:country])
    render json: @hotels
  end

  def countries
    @countries = Hotel.select(:country).distinct
    render json: @countries
  end

  def cities_by_country
    @cities = Hotel.where(country: params[:country]).select(:city).distinct
    render json: @cities
  end

  def create
    if @current_user && @current_user.role == 'admin'
      @hotel = Hotel.new(hotel_params)
      if @hotel.save
        render json: { message: 'Hotel was successfully created.' }, status: :created
      else
        render json: @hotel.errors, status: :unprocessable_entity
      end
    else
      render json: { message: 'You are not authorized to perform this action.' }, status: :unauthorized
    end
  end

  def destroy
    if @current_user && @current_user.role == 'admin'
      @hotel = Hotel.find(params[:id])

      if @hotel.destroy
        render json: { message: 'Hotel was successfully destroyed.' }
      else
        render json: { message: 'Something went wrong.' }
      end
    else
      render json: { message: 'You are not authorized to perform this action.' }, status: :unauthorized

    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :city, :country, :room_price, :pet_friendly, :number_of_rooms,
                                  :stars, :current_free_rooms, :image_url, :photo_url, :image, :user_id)
  end
end
