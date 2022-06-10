class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = @current_user.reservations
    render json: { id: @reservations.id, room_number: @reservations.room_number,
                   hotel_id: @reservations.hotel_id, name: @reservations.hotel.name,
                   price: @reservations.hotel.room_price, stars: @reservations.hotel.stars }
  end

  def create
    @reservation = @current_user.reservations.new(reservation_params)

    if @reservation.save
      render json: { message: 'Reservation was successfully created.' }, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = @current_user.reservations.find(params[:id])

    if @reservation.destroy
      render json: { message: 'Reservation was successfully destroyed.' }
    else
      render json: { message: 'Something went wrong.' }
    end
  end

  def reservation_params
    params.require(:reservation).permit(:room_number, :hotel_id)
  end
end
