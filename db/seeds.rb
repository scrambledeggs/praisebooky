# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
department = Department.create!(name: 'Tech')

User.create!(email: 'test1@gmail.com', first_name: 'test1', last_name: '1', department: department)

User.create!(email: 'test2@gmail.com', first_name: 'test1', last_name: '2', department: Department.find(1))

#Vote.create!(point: 1, receiver_id: 15, comment: 'Good comment', department: Department.find(14), user: User.find(14))

Vote.create!(point: 1, comment: 'good', department: Department.find(2), user_id: 4, receiver_id: 5)

puts "User successfully voted"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?