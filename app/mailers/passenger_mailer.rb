class PassengerMailer < ApplicationMailer
	default from: 'noreply@flightbooker.com'

	def thankyou_mail
		@booking = params[:booking]
		@passengers = @booking.passenger_ids
		@booker = Passenger.find(@passengers.first)
		@booking_ref = @booking.id
		
		@url = "http://localhost:3000/bookings/search"
		mail(to: @booker.email, Subject: 'Thank you, your Flight has been booked!')
	end
end
