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
  puts "Hero: #{hero_name}"
  Hero.find_or_create_by(name: hero_name)
  key["biography"].map do |biograph, value|
    if biograph == "full-name"
      puts "#{biograph}: #{value}"
      # secret_id = value
      Hero.find_or_create_by(full_name: value)
    end
  #   puts "#{biograph}: #{value}"
  end
  key["powerstats"].select do |powerstat, value|
    if powerstat == "intelligence"
      puts "#{powerstat}: #{value}"
    end
    # binding.pry
  end

    # puts #{powerstat}: #{value}"
    # Hero.find_or_create_by()
end
