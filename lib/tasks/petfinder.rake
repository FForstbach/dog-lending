require "yaml"


namespace :petfinder do
  desc "Import dogs from petfinder"
  task :import, [:number] => :environment do |t, args|
    puts "Importing #{args[:number]} dogs"

    dogs = []

    sizes = {"S" => "small", "M" => "medium", "L" => "large", "XL" => "large"}

    args[:number].to_i.times do
      response = RestClient.get "http://api.petfinder.com/pet.getRandom", {params: {

        key:ENV["DOGFINDER_APIKEY"],
        output: "basic",
        format: "json",
        animal: "dog"

        }}

      data = JSON.parse(response.body)


      if data["petfinder"]["pet"]["breeds"]["breed"].kind_of?(Array)
        breed = data["petfinder"]["pet"]["breeds"]["breed"][0]["$t"]
      else
        breed = data["petfinder"]["pet"]["breeds"]["breed"]["$t"]
      end
      dogs << {
        name: data["petfinder"]["pet"]["name"]["$t"],
        size: sizes[data["petfinder"]["pet"]["size"]["$t"]],
        description: data["petfinder"]["pet"]["description"]["$t"],
        breed: breed,
        photo: data["petfinder"]["pet"]["media"]["photos"]["photo"][0]["$t"]
      }
    end

    File.open(Rails.root.join('db', 'seeds', 'dogs_petfinder.yml'), "w") do |file|
      file.write dogs.to_yaml
    end
  end

end
