class ReservationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  api :GET, '/hotels/id/reservations', 'List of all available reservations for a given user'

  def index
    @reservations = current_user.reservations
    render json: @reservations
  end

  api :GET, '/hotels/id/reservations/id', 'Shows reservation for a given id'

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def new
    @reservation = Reservation.new
  end

  api :POST, '/hotels/id/reservations', 'Add a new reservation to the database for a given user'

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: { message: 'Reservation was successfully created.' }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/hotels/id/reservations/id', 'Update reservation for a given id'

  def update
    if @reservation.update(reservation_params)
      render json: { message: 'Reservation was successfully updated.' }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, '/hotels/id/reservations/id', 'Delete reservation for a given id'

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
