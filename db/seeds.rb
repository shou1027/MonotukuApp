# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  User.create(name: (0...12).map{ ('A'..'Z').to_a[rand(26)] }.join, password: (0...8).map{ ('A'..'Z').to_a[rand(26)] }.join, image_name: "default.png")
end