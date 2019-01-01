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
  	
  end


end
