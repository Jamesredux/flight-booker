class PassengerMailer < ApplicationMailer
	default from: 'noreply@flightbooker.com'

	def thankyou_mail
#change to take an argument from booking.create
		@booking = params[:booking]
		@passengers = @booking.passenger_ids
		@booker = Passenger.find(@passengers.first)
		@booking_ref = @booking.id
		
		@url = "http://localhost:3000/bookings/search"
		mail(to: @booker.email, Subject: 'Thankyou for booking your flight')
	end
end
