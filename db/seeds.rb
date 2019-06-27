# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user = User.create(email: "admin@test.com", password: "123456", user_type: "admin", user_name: "admin1")
#user.save!

Asset.create(name: 'google', price: 2000).save!
Asset.create(name: 'facebook', price: 1500).save!
Asset.create(name: 'amazon', price: 5000).save!
Asset.create(name: 'netflix', price: 3000).save!
