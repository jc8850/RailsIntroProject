# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

def swapapi_fetch(url)
  JSON.parse(URI.open(url).read)
end

def poke_url(id)
  "https://pokeapi.co/api/v2/pokemon/#{id}"
end

#Poke_types.destoy_all
#Types.destoy_all
Pokemon.destoy_all

#Gather pokemon Data


poke_ids = 1..9
counter = 0

puts "gathering pokemon data"

poke_ids.each do |character_id|
  pokemon = swapapi_fetch(poke_url(character_id))
  puts "Name: #{pokemon['name']}"
  name = pokemon['name']
  puts "ID: #{pokemon['id']}"
  id = pokemon['id'].to_i
  puts "Imagelink: #{pokemon['sprites']['other']['official-artwork']["front_default"]}"
  imgLink = pokemon['sprites']['other']['official-artwork']["front_default"]

  Pokemon.create(name: name, imgLink: imgLink).update_column(:id, id)


  counter += 1
end

puts "#{counter} pokemon data fetched"


#Gather type data

#Gather poketype data
