# 20.times do |n|
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                )
# end

User.create!(name: "tomoko",
	         email: "tomoko.air.tokyo@gmail.com",
	         password: ENV["password"],
	         password_confirmation: ENV["password_confirmation"],
	         admin: true)