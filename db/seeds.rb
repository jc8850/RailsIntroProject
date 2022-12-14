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

PokeType.destroy_all
Type.destroy_all
Pokemon.destroy_all

#Gather pokemon Data


poke_ids = 1..151
counter = 0

puts "gathering pokemon data"

poke_ids.each do |character_id|
  pokemon = swapapi_fetch(poke_url(character_id))
  puts "Name: #{pokemon['name'].capitalize()}"
  name = pokemon['name'].capitalize
  puts "ID: #{pokemon['id']}"
  id = pokemon['id'].to_i
  puts "Imagelink: #{pokemon['sprites']['other']['official-artwork']["front_default"]}"
  imgLink = pokemon['sprites']['other']['official-artwork']["front_default"]
  puts "\n\n\n"
  Pokemon.create(name: name, imgLink: imgLink).update_column(:id, id)


  counter += 1
end

puts "#{counter} pokemon data fetched"

#----------------type data gathering-------------------------#
puts "grabbing type data"
type_ids = 1..16
counter = 0

type_ids.each do |t_id|
  type = swapapi_fetch("https://pokeapi.co/api/v2/type/#{t_id}")
  puts "Name: #{type['name'].capitalize()}"
  name = type['name'].capitalize()
  puts "ID: #{type['id']}"
  id = type['id'].to_i
  puts "\n\n\n"
  Type.create(name: name).update_column(:id, id)


  counter += 1
end

puts "#{counter} type data fetched"

#--------------poketype data gathering------------------------#
puts "grabbing PokeType data"

poke_ids = 1..151
counter = 0


poke_ids.each do |character_id|
  pokemon = swapapi_fetch(poke_url(character_id))

  pokemon['types'].each do |n|
    type = swapapi_fetch(n['type']['url'])

    if (type['id'] <= 16)
      puts "pokemon name: #{pokemon['name']}"
      puts "pokemon id: #{pokemon['id']}"
      pokeId = pokemon['id'].to_i
      puts "Type name: #{type['name']}"
      puts "Type ID: #{type['id']}"
      typeId = type['id'].to_i
      puts "\n\n"

      PokeType.create(pokemon_id: pokeId, type_id: typeId)
    counter += 1
    end
  end
end

puts "#{counter} pokeType rows fetched"
