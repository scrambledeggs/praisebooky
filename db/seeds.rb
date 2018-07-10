AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

tech = Department.create!(name: 'Tech')
market = Department.create!(name: 'Marketing')

me = User.create!(email: 'clydeang421@gmail.com', first_name: 'Clyde', last_name: 'Ang', department: tech)

tech1 = User.create!(email: 'tech1@gmail.com', first_name: 'tech1', last_name: 'dummy', department: tech)
tech2 = User.create!(email: 'tech2@gmail.com', first_name: 'tech2', last_name: 'test', department: tech)

market1 = User.create!(email: 'market1@gmail.com', first_name: 'market1', last_name: 'test', department: market)
market2 = User.create!(email: 'market2@gmail.com', first_name: 'market2', last_name: 'dummy', department: market)

Vote.create!(point: 1, voter: me, receiver: tech1, comment: 'good', department: tech, created_at: 1.month.ago)
Vote.create!(point: 1, voter: me, receiver: tech1, comment: 'good', department: tech)
Vote.create!(point: 1, voter: tech2, receiver: me, comment: 'good', department: tech)
Vote.create!(point: 1, voter: market1, receiver: market2, comment: 'good', department: market)