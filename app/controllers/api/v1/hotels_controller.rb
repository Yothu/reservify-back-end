class Api::V1::HotelsController < ApplicationController
  def index
    @all_hotels = Hotel.all
    @hotels = []
    @all_hotels.each do |hotel|
      hotel.image_url = hotel.image.url
      @hotels << hotel
    end
    render json: @hotels
  end

  def show
    @hotel = Hotel.find(params[:id])
    @hotel.image_url = @hotel.image.url
    render json: @hotel
  end

  def hotels_by_location
    @hotels = Hotel.where(city: params[:city], country: params[:country])
    render json: @hotels
  end

  def countries
    countries_arr = []
    @countries = Hotel.select(:country).distinct
    @countries.each do |country|
      countries_arr << country.country
    end
    render json: countries_arr
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
    params.require(:hotel).permit(:name, :address, :city, :country, :room_price, :pet_friendly, :wifi,
                                  :air_conditioning, :public_pool, :number_of_rooms, :stars, :current_free_rooms,
                                  :image_url, :user_id, :description, :image)
  end
end
