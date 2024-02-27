# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Bike.destroy_all
puts "Creating users..."

User.create!(email: "shlomi@gmail.com", password: "123456")
User.create!(email: "bahar@gmail.com", password: "123456")
User.create!(email: "jackie@gmail.com", password: "123456")
User.create!(email: "maiia@gmail.com", password: "123456")
User.create!(email: "francesca@gmail.com", password: "123456")
User.create!(email: "sema@gmail.com", password: "123456")

puts "Users created!"

puts "Creating bikes..."

Bike.create!(name: "ebike", price: 5, description: "good condition", user: User.all.sample)
Bike.create!(name: "gazelle", price: 6, description: "brand new" , user: User.all.sample)
Bike.create!(name: "Lekker", price: 3, description: "Lekkere fiets", user: User.all.sample)
Bike.create!(name: "marrinse", price: 4, description: "mountain bikes", user: User.all.sample)
Bike.create!(name: "ebike second hand" , price: 3 , description: "cool vintage", user: User.all.sample)
Bike.create!(name: "Canyon", price: 7, description: "snelle fiets", user: User.all.sample)
Bike.create!(name: "Elops", price: 5, description: "for perfect riding", user: User.all.sample)
Bike.create!(name: "Scooter", price: 8, description: "super fast", user: User.all.sample)
Bike.create!(name: "gazelle 124", price: 5 , description: "very handy", user: User.all.sample)
Bike.create!(name: "Giant", price: 6, description: "is niet gestolen", user: User.all.sample)

puts "Bikes are created..."
