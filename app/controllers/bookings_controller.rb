class BookingsController < ApplicationController
  def new
  	@flight = Flight.find_by_id(params[:flight_id])
  	@party_size = params[:party_size].to_i
  	@booking = Booking.new
  	@party_size.times { @booking.passengers.build }
 
  end

  def show
     @booking = Booking.find_by_id(params[:id]) 
     if @booking 
      @flight =  Flight.find(@booking.flight_id)
      @passengers = list_passengers(@booking)
     end 
  end

  def create
  	@booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Booking confirmed"
      redirect_to @booking
    else
      @flight = Flight.find_by_id(params[:flight_id])
      render 'new'
    end   
  end

  def index
    @booking = Booking.find(params[:id])
  end



  private

  def booking_params
    params.require(:booking).permit(:flight_id, 
                      passengers_attributes: [:name, :email, :passport_no])
  end


  def list_passengers(booking)
    passenger_array = []
    passenger_ids = booking.passenger_ids
    passenger_ids.each do |x|
      passenger = Passenger.find(x)
      passenger_array<<passenger
    end  
    return passenger_array
  end
#   to be added to booking params 
end


