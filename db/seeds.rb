

Airport.delete_all
Flight.delete_all
#currently works with airports in order in db 1-4. so must reset db before reseeding or
#seeding will not work.

# Airports

#Airport.create!(name: "Tokyo",
#								code: "HND")

#Airport.create!(name: "Los Angeles",
#								code: "LAX")

#Airport.create!(name: "London",
#								code: "LHR")

#Airport.create!(name: "Bangkok",
#								code: "BKK")

airports = {"HND" => "Tokyo", 
							"LAX" => "Los Angeles", 
							"LHR" => "London",
							"BKK" => "Bangkok"}

airports.each do |code, name|
	Airport.create!(name: name, code: code)
end								

#Flights



#create random dates

dates = []
5.times do 
	dates << (Faker::Date.forward(25))
end

def random_datetime(date)
	date = Faker::Time.between(date.beginning_of_day, date.end_of_day, :all)	
	return date
end



tokyo_flights = 	{ 2 => 600, 3 => 780, 4 => 420 }
lax_flights = 		{ 1 => 600, 3 => 600, 4 => 1140 }
london_flights = 	{ 1 => 780, 2 => 600, 4 => 660 }
bangkok_flights = { 1 => 420, 2 => 1140, 3 => 660 }

# Tokyo flights.

tokyo_flights.each do |code, duration|
	dates.each do |date|
		#goes through each of the dates
		5.times do 
			#creates 5 departures per day
			Flight.create!(from_airport_id: 1, 
											to_airport_id: code, 
											dep_time: random_datetime(date), 
											duration: duration )
		end
	end
end			

# Los Angeles flights
lax_flights.each do |code, duration|
	dates.each do |date|
		5.times do 
			Flight.create!(from_airport_id: 2, 
											to_airport_id: code, 
											dep_time: random_datetime(date), 
											duration: duration )
		end
	end
end		

#london flights

london_flights.each do |code, duration|
	dates.each do |date|
		5.times do 
			Flight.create!(from_airport_id: 3, 
											to_airport_id: code, 
											dep_time: random_datetime(date), 
											duration: duration )
		end
	end
end			

#bangkok flights

bangkok_flights.each do |code, duration|
	dates.each do |date|
		5.times do 
			Flight.create!(from_airport_id: 4, 
											to_airport_id: code, 
											dep_time: random_datetime(date), 
											duration: duration )
		end
	end
end			