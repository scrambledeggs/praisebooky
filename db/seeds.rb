# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
department = Department.create!(name: 'Tech')

user1 = User.create!(email: 'test1@gmail.com', first_name: 'test', last_name: '1', department: department)
user2 = User.create!(email: 'test2@gmail.com', first_name: 'test', last_name: '2', department: department)

vote = Vote.create!(point: 1, comment: 'good comment', department: department, user: user1, receiver_id: 2)

puts "successfully made default user, receiver, vote"