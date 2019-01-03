class Passenger < ApplicationRecord
	belongs_to :booking
	#belongs_to :flight
	

	before_save :downcase_email
	
	validates :name, presence: true, length: { maximum: 100 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
							format: { with: VALID_EMAIL_REGEX }, 
							uniqueness: { case_sensitive: false }

	validates :passport_no, presence:true
end
