class Api::V1::ReservationsController < ApplicationController
  # load_and_authorize_resource

  def index
    @reservations = @current_user.reservations
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: { message: 'Reservation was successfully created.' }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: { message: 'Reservation was successfully updated.' }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy

    if @reservation.destroy
      render json: { message: 'Reservation was successfully destroyed.' }
    else
      render json: { message: 'Something went wrong.' }
    end
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :room_number, :hotel_id, :user_id)
  end
end
