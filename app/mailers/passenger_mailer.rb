class PassengerMailer < ApplicationMailer
	default from: 'noreply@flightbooker.com'

	def thankyou_mail
		@booking = params[:booking]
		@passengers = @booking.passenger_ids
		@booker = Passenger.find(@passengers.first)
		@booking_ref = @booking.id
		
		@url = :bookings_search
		#"http://localhost:3000/bookings/search"
		#"https://redux-flights.herokuapp.com/bookings/search"
		mail(to: @booker.email, Subject: 'Thank you, your Flight has been booked!')
	end
end
