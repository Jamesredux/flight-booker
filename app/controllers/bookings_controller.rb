class BookingsController < ApplicationController
  def new
  	@flight = Flight.find(params[:flight_id])
  	@party_size = params[:party_size].to_i
  	@booking = Booking.new
  	@party_size.times { @booking.passengers.build }
 
  end

  def show
  end

  def create
  	@booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Booking confirmed"
      redirect_to bookings_path
    else
      @flight = Flight.first
      render 'new'
    end   
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes:       [:name, :email, :passport_no]   )
  end

#   to be added to booking params 
end


