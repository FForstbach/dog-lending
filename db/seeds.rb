# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.destroy_all
User.destroy_all


seed_file = Rails.root.join('db', 'seeds', 'dogs.yml')
dogs = YAML::load_file(seed_file)

10.times do
  u = User.new(email: Faker::Internet.free_email, password: "123456")
  u.save!
end

dogs.each do |dog|
  d = Dog.new(user_id: User.order("RANDOM()").first.id,
    name: dog["name"],
    age: rand(1..12),
    size: dog["size"],
    description: dog["description"],
    breed: dog["breed"],
    photo: File.open(File.join(Rails.root, "app/assets/images", dog["photo"])),
    location: ["Hauptstr. ","Torstr. ","Kantstr.","Seestr.","Sonnenallee","Berliner Str. ", "Landsberger Allee "].sample + rand(1..80).to_s + ", Berlin" )
  d.save!
end









