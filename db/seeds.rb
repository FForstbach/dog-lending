# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


seed_file = Rails.root.join('db', 'seeds', 'dogs.yml')
dogs = YAML::load_file(seed_file)

Dog.clear_index!


if User.count == 0
  puts "Creating users"
  10.times do
    u = User.new(email: Faker::Internet.free_email, password: "123456")
    u.save!
  end
else
  puts "Already have users"
end

puts "Creating #{dogs.count} dogs..."
dogs.each_with_index do |dog, index|
  d = Dog.find_or_initialize_by(id: index + 1)
  d.user_id ||= User.order("RANDOM()").first.id
  d.name = dog["name"]
  d.age = rand(1..12)
  d.size = dog["size"]
  d.description = dog["description"]
  d.breed = dog["breed"]
  d.photo = File.open(File.join(Rails.root, "app/assets/images", dog["photo"]))
  d.location = ["Hauptstr. ","Torstr. ","Kantstr. ","Seestr. ","Sonnenallee ","Berliner Str. ", "Landsberger Allee "].sample + rand(1..80).to_s + ", Berlin"
  d.favorite_snack = ["Pizza crust", "Cheezburger," "Other dogs feces," "Filet Mignon", "Anything I can find", "Lasagne", "Currywurst", "an ice cube", "ice cream", "Meatballs", "Grass"].sample
  d.favorite_toy = ["Chewy Vuitton Bone", "Chewlululemon Mat", "Pugg Boot", "the family cat", "Diane von Furstinbone", "Tennis ball" ].sample
  d.save!
end









