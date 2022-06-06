class HotelsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  !api :GET, '/hotels' , 'List of all available hotels'
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

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels }
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :city, :country, :room_price, :pet_friendly, :number_of_rooms,
                                  :stars, :current_free_rooms, :user_id)
  end
end
