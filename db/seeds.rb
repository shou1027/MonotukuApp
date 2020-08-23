# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  User.create(name: (0...12).map{ ('A'..'Z').to_a[rand(26)] }.join, password: (0...8).map{ ('A'..'Z').to_a[rand(26)] }.join, image_name: "default.jpg")
end

users = User.all
users.each do |user|
  ran = rand(20)
  ran.times do |n|
    ran2 = rand(40) + 10
    ran3 = rand(20)
    ran4 = rand(200)
    user_post = user.posts.build(title: (0..ran2).map{ ('A'..'Z').to_a[rand(26)] }.join, image_name: "default.jpg", tags: (0..ran3).map{ ('A'..'Z').to_a[rand(26)] }.join, content: (0..ran4).map{ ('A'..'Z').to_a[rand(26)] }.join)
    user_post.save
  end
end