# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "json"

puts "deleting all pokemons..."
Booking.destroy_all
Pokemon.destroy_all


locations = ["Birmingham", "Liverpool", "Manchester", "London", "Nottingham", "Newcastle", "Leeds", "Coventry", "Essex", "York", "Cambridge", "Paris", "New York", "Nairobi", "Madrid", "Florida"]

15.times do
  user = User.create(
    # first_name: Faker::Name.first_name,
    # last_name: Faker::Name.last_name,
    # gender: Faker::Gender.binary_type.downcase,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  puts name = Faker::Games::Pokemon.name
  url = "https://pokeapi.co/api/v2/pokemon/#{name.downcase}"
  pokemon = JSON.parse(URI.open(url).read)
  moves = pokemon['abilities'].map! do |ability|
    ability['ability']['name'].capitalize
  end
  abilities = moves.join('; ')

  image_path = pokemon["sprites"]["other"]["dream_world"]["front_default"]
  element = pokemon["types"][0]["type"]["name"]
  # pokemon = Pokemon.create(name: name, move: abilities, image_path: image_path, element: element, user: user)
  pokemon = Pokemon.create(name: name, move: abilities, image_path: image_path, element: element, user: user, address: locations.sample)

  file = URI.open(image_path)
  pokemon.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  pokemon.save!


  end
