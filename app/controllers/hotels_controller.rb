class HotelsController < ApplicationController     
  before_action :authenticate_user!

  
  # GET /hotels
  # GET /hotels.json
  def index
      @hotels = Hotel.all
      render json: @hotels
  end
  
  # GET /hotels/1
  # GET /hotels/1.json
  def show
      @hotel = Hotel.find(params[:id])
      render json: @hotel
  end
  
  # GET /hotels/new
  def new
      @hotel = Hotel.new
  end
  
 
 
  # POST /hotels
  # POST /hotels.json
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
  
  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
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
  
  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
      @hotel.destroy
      respond_to do |format|
      format.html { redirect_to hotels }
      end
  end

  private

  def hotel_params
      params.require(:hotel).permit(:name, :address, :city, :country, :room_price, :pet_friendly, :number_of_rooms, :stars, :current_free_rooms, :user_id)
  end
  
end
