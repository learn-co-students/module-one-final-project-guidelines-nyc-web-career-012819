require_relative '../config/environment'

puts "Welcome to the Hero Searcher"

puts "Enter a search term:"

search_term = gets.chomp

url = "https://superheroapi.com/api.php/10156490789022732/search/#{search_term}"

response = RestClient.get(url)
# this response is a String, we need to convert into JSON (parse it into json)
results = JSON.parse(response.body)

results["results"].each do |key|
  hero_name = key["name"]
  hero_full_name = key["biography"]["full-name"]
  hero_gender = key["appearance"]["gender"]
  hero_height = key["appearance"]["height"]
  hero_weight = key["appearance"]["weight"]
  hero_birth_place = key["biography"]["place-of-birth"]
  hero_occupation = key["work"]["occupation"]
  hero_powerstats_int = key["powerstats"]["intelligence"]
  hero_powerstats_str = key["powerstats"]["strength"]
  hero_powerstats_speed = key["powerstats"]["speed"]
  hero_powerstats_power = key["powerstats"]["power"]
  hero_powerstats_combat = key["powerstats"]["combat"]
  puts "Hero: #{hero_name}"
  puts "Full Name: #{hero_full_name}"
  puts "Gender: #{hero_gender}"
  puts "Height: #{hero_height}"
  puts "Weight: #{hero_weight}"
  puts "Birth Place: #{hero_birth_place}"
  puts "Occupation: #{hero_occupation}"
  puts "Intelligence: #{hero_powerstats_int}"
  puts "Strength: #{hero_powerstats_str}"
  puts "Speed: #{hero_powerstats_speed}"
  puts "Power: #{hero_powerstats_power}"
  puts "Combat: #{hero_powerstats_combat}"
  Hero.find_or_create_by(name: hero_name, full_name: hero_full_name, gender: hero_gender, height: hero_height, weight: hero_weight, birth_place: hero_birth_place, occupation: hero_occupation, int: hero_powerstats_int, str: hero_powerstats_str, speed: hero_powerstats_speed, power: hero_powerstats_power, combat: hero_powerstats_combat)

  # key["biography"].map do |biograph, value|
  #   if biograph == "full-name"
  #     puts "#{biograph}: #{value}"
  #     # secret_id = value
  #     Hero.find_or_create_by(name: hero_name, full_name: value)
  #   end
  # #   puts "#{biograph}: #{value}"
  # end
  # key["powerstats"].select do |powerstat, value|
  #   if powerstat == "intelligence"
  #     puts "#{powerstat}: #{value}"
  #   end
  #   # binding.pry
  # end

    # puts #{powerstat}: #{value}"
    # Hero.find_or_create_by()
end
