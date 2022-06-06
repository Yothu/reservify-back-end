class ReservationsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    
    # GET /reservations
    # GET /reservations.json
    def index
        @reservations = Reservation.all
        render json: @reservations
    end
    
    # GET /reservations/1
    # GET /reservations/1.json
    def show
        @reservation = Reservation.find(params[:id])
        render json: @reservation
    end
    
    # GET /reservations/new
    def new
        @reservation = Reservation.new
    end
    
   
   
    # POST /reservations
    # POST /reservations.json
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
    
    # PATCH/PUT /reservations/1
    # PATCH/PUT /reservations/1.json
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
    
    # DELETE /reservations/1
    # DELETE /reservations/1.json
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
