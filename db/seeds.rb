# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.destroy_all
User.destroy_all

10.times do
  u = User.new(email: Faker::Internet.free_email, password: "123456")
  u.save
end

20.times do
  d = Dog.new(user_id: User.first.id,
    name: Faker::StarWars.character,
    age: rand(1..12),
    size: ["small","medium","large"].sample,
    description: Faker::Hipster.sentences,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude)
  d.save
end
