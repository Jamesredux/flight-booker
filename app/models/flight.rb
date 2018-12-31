class Flight < ApplicationRecord
	belongs_to :from_airport, :class_name => "Airport"
	belongs_to :to_airport, :class_name => "Airport"

	validates :from_airport_id, presence: true
	validates :to_airport_id, presence: true
	validates :dep_time, presence:true
	validates :duration, presence: true
	
	def self.list_dates
		dates = Flight.all.order(:dep_time)
		dates = dates.map { |d| [d.dep_time.strftime("%d %^b %Y"), d.dep_time.strftime("%Y%m%d") ] }
		dates.uniq!
	
		
	end

	def self.search(from, destination, date)
			Flight.where(from_airport_id:  from,
  									to_airport_id: destination)
  									#dep_time: Flight.within_date(date))
	end


	def self.within_date(date)
		unless date.nil?
			date = date.to_date
			date.beginning_of_day..date.end_of_day
		end	
		
	end

	private



end
