class FlightsController < ApplicationController

  def index
  	@airports = Airport.all.map{ |airport| [ airport.name, airport.id ] }
  	@passenger_options = [1,2,3,4].map{ |x| [x,x] }
  	@flight_days = Flight.list_dates
  	@flights = Flight.search(params[:from_airport], params[:to_airport], params[:chosen_date])
  	@party_size = params[:party_size]
  
  end



  private

 
end
