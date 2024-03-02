# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  User.create!(email: 'admin@example.com', password: 'adminadmin',
               password_confirmation: 'adminadmin', avatar: File.open("app/assets/images/def_avatar.png"))
  AdminUser.create!(email: 'admin@example.com', password: 'adminadmin',
                    password_confirmation: 'adminadmin')
  exec "rake app:migrate_images"
  10.times do 
    user = User.create!(email: (Faker::FunnyName.two_word_name).split(" ").join("_") + "@example.com",
                password: "useruser", password_confirmation: "useruser", avatar: File.open("app/assets/images/def_avatar.png") )
    1.times do 
      Category.all.each do |category|
        category.photos.each do |photo|
          photo = category.photos.find(photo.id)
          photo.upvote! user
          photo.comments.create!(body: (Faker::Lorem.questions(number: 1)).join , photo_id: photo.id, user_id: user.id)
        end
      end
    end
  end
end
