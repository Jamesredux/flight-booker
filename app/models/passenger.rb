class Passenger < ApplicationRecord
	belongs_to :booking
	belongs_to :flight
	
	#validates :name, presence: true
	#validates :email, presence: true
	#validates :passport_no, presence:true
end
