class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = @current_user.reservations
    render json: @reservations.map { |reservation| { reservation:, hotel: reservation.hotel } }
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
