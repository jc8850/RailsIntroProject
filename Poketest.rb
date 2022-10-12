#This file was used to test reading data from the API. It will not be used in the final project

require 'open-uri'
require 'json'

def swapapi_fetch(url)
  JSON.parse(URI.open(url).read)
end

def poke_url(id)
  "https://pokeapi.co/api/v2/pokemon/#{id}"
end

#bulba = swapapi_fetch('https://pokeapi.co/api/v2/pokemon/1')

#bulba['types'].each do |n|
# puts n['type']
#end

# poke_ids = 1..3

# poke_ids.each do |character_id|
#   pokemon = swapapi_fetch(poke_url(character_id))
#   puts "Name: #{pokemon['name']}"
#   puts "ID: #{pokemon['id']}"
#   puts "Types: "
#   pokemon['types'].each do |n|
#     #puts "     #{n['type']['name']}"
#     type = swapapi_fetch(n['type']['url'])

#     puts "     Type name: #{type['name']}"
#     puts "     Type ID: #{type['id']}"
#   end
#   puts "Imagelink: #{pokemon['sprites']['other']['official-artwork']["front_default"]}"
#   puts
#   puts
# end

#---------------------------------------------------------#
# puts "Test grabbing pokemon data"

# poke_ids = 1..151
# counter = 0


# poke_ids.each do |character_id|
#   pokemon = swapapi_fetch(poke_url(character_id))
#   puts "Name: #{pokemon['name']}"
#   puts "ID: #{pokemon['id']}"
#   puts "Imagelink: #{pokemon['sprites']['other']['official-artwork']["front_default"]}"
#   puts "\n\n\n"
#   counter += 1
# end

# puts "#{counter} pokemon data fetched"


#---------------------------------------------------------#
# puts "Test grabbing type data"
# type_ids = 1..16
# counter = 0

# type_ids.each do |t_id|
#   type = swapapi_fetch("https://pokeapi.co/api/v2/type/#{t_id}")
#   puts "Name: #{type['name']}"
#   puts "ID: #{type['id']}"
#   puts "\n\n\n"
#   counter += 1
# end

# puts "#{counter} type data fetched"

#---------------------------------------------------------#
puts "test grabbing PokeType data"

poke_ids = 1..151
counter = 0


poke_ids.each do |character_id|
  pokemon = swapapi_fetch(poke_url(character_id))

  pokemon['types'].each do |n|
    type = swapapi_fetch(n['type']['url'])

    if (type['id'] <= 16)
      puts "pokemon name: #{pokemon['name']}"
      puts "pokemon id: #{pokemon['id']}"
      puts "Type name: #{type['name']}"
      puts "Type ID: #{type['id']}"
      puts "\n\n"
    counter += 1
    end
  end
end

puts "#{counter} pokeType rows fetched"