class ReservationsController < ApplicationController
  before_action :authenticate_user!
    load_and_authorize_resource
    !api :GET, '/hotels/id/reservations' , 'List of all available reservations for a given user'
  def index
    @reservations = current_user.reservations
    render json: @reservations
  end
  !api :GET, '/hotels/id/reservations/id' , 'Shows reservation for a given id'
  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def new
    @reservation = Reservation.new
  end
  !api :POST, '/hotels/id/reservations', 'Add a new reservation to the database for a given user'
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations }
    end
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :hotel_id, :user_id)
  end
end
