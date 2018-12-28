# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Airports
Airport.delete_all


Airport.create!(name: "Beijing",
								code: "PEK")

Airport.create!(name: "Dubai",
								code: "DXB")

Airport.create!(name: "Tokyo",
								code: "HND")

Airport.create!(name: "Los Angeles",
								code: "LAX")

Airport.create!(name: "London",
								code: "LHR")

Airport.create!(name: "Bangkok",
								code: "BKK")																																								