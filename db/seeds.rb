

Airport.delete_all
Flight.delete_all
#currently works with airports in order in db 1-4. so must reset db before reseeding or
#seeding will not work.

# Airports


airports = {"HND" => "Tokyo", 
							"LAX" => "Los Angeles", 
							"LHR" => "London",
							"BKK" => "Bangkok"}

airports.each do |code, name|
	Airport.create!(name: name, code: code)
end								

#Flights


tokyo_flights = 	 { 2 => 600, 3 => 780, 4 => 420 } 
lax_flights = 		 { 1 => 600, 3 => 600, 4 => 1140 } 
london_flights = 	 { 1 => 780, 2 => 600, 4 => 660 } 
bangkok_flights =  { 1 => 420, 2 => 1140, 3 => 660 } 

airport_schedule = [tokyo_flights, lax_flights, london_flights, bangkok_flights]

#create dates

@dates = []
day_count = 2
5.times do 
	@dates << Date.today+day_count.days
	day_count+= 2
end


def create_airport_departures(airport_schedule)
	from_airport = 1
	airport_schedule.each do |destinations_hash|
		create_flights(from_airport, destinations_hash)
		from_airport += 1
	end

end


def create_flights(from_airport, destinations_hash)
	destinations_hash.each do |desination_code, duration|
		@dates.each do |date|
		#goes through each of the dates
			hour_count = rand(4..8)
				5.times do 
			#creates 5 departures per day
					Flight.create!(from_airport_id: from_airport, 
											to_airport_id: desination_code, 
											dep_time: random_datetime(date, hour_count), 
											duration: duration )
				hour_count+=3
			end
		end
	end		
end

def random_datetime(date, hour_count)
	date = date.to_datetime+hour_count.hours

	#date = Faker::Time.between(date, date).utc
	#date = date.beginning_of_hour
	return date
end




create_airport_departures(airport_schedule)
	
