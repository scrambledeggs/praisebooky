# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
department = Department.create!(name: 'Tech')

user = User.create!(email: 'test1@gmail.com', first_name: 'test1', last_name: '1', department: department)

user2 = User.create!(email: 'test2@gmail.com', first_name: 'test1', last_name: '2', department: department)

vote = Vote.create!(point: 1, receiver_id: 11, comment: 'Good comment', department: department, user: user)

vote1 = Vote.create!(point: 1, receiver_id: 2, comment: 'Good comment', department: department, user: user)
vote2 = Vote.create!(point: -1, receiver_id: 2, comment: 'Good comment', department: department, user: user)
vote3 = Vote.create!(point: -1, receiver_id: 2, comment: 'Good comment', department: department, user: user)

puts "User successfully voted"
