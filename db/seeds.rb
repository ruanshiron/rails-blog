# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create!(name:  "Nguyen Vinh",
  email: "theten12@gmail.com",
  password:              "Theten12",
  password_confirmation: "Theten12",
  confirmed_at: Time.zone.now)

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    confirmed_at: Time.zone.now)
end

# Posts
users = User.order(:created_at).take(6)
50.times do
title = Faker::Lorem.paragraph(sentence_count: 2)
content = Faker::Lorem.paragraph(sentence_count: 20)
users.each { |user| user.posts.create!(title: title, content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }