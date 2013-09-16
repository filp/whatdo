# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create 20 mock users with 0-30 ideas each, and have them
# vote randomly on other ideas.
20.times do
  user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "12mockpassword")

  0.upto(rand(1..30)) do
    user.ideas.create!(title: Faker::Commerce.product_name, body: Faker::Company.catch_phrase)
  end

  Idea.where("user_id != ?", user.id).sample(rand(5..30)).each do |idea|
    idea.vote voter: user
  end
end