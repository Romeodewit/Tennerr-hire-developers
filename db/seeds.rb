# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Service.destroy_all
User.destroy_all

user1 = User.new(email: "mrabetr@hotmail.com", password: "123456")

service1 = Service.new(title: "Web Dev", description: "Ruby on Rails app", category: "Full-Stack Development", price: "20")
service1.user = user1
service1.save!

booking1 = Booking.new(status: "Pending", date: Date.today, deadline: Date.today)
booking1.user = user1
booking1.service = Service.first
booking1.save!
