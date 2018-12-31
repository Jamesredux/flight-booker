class BookingsController < ApplicationController
  def new
  	@flight = Flight.find(params[:flight_id])
  	@party_size = params[:party_size]
  end

  def show
  end
end
