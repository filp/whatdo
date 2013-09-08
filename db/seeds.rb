# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 10 mock users with 0-20 ideas each
10.times do
  x = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "12mockpassword")

  0.upto(rand(1..20)) do
    x.ideas.create!(title: Faker::Commerce.product_name, body: Faker::Company.catch_phrase)
  end
end