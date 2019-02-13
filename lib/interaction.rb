def main_menu
  puts " "
  puts "Enter Your Command"
  user_command = gets.chomp

  case user_command
  when "login", '1'
    login_process
  when "create account", '2'
    create_account
  when "help", '3'
    main_option_menu
    main_menu
  when "exit", '4'
    abort("Thank You.")
  else
    puts "Invalid command"
    main_menu
  end
end

def login_process
  puts "Enter a Username to begin, or Enter \-exit to return to Main Menu."
  user_command = gets.chomp
  if user_command == '-exit' then exit_to_main end
  login_name = user_command
  if User.find_user(login_name) == nil
    puts "User doesn't exist!"
    login_process
  else
    user_option_menu
    user_menu
  end
end

def create_account
  puts "Enter your name to create your account, or enter \-exit to return to the main menu."
  user_command = gets.chomp
  if user_command == '-exit' then exit_to_main end
  user_name = user_command
  if User.find_user(user_name) == nil
    User.create(name: user_name)
    puts " "
    puts "User Created!!"
    user_option_menu
    after_user_created
  else
    puts "Username taken, please enter another name."
    puts " "
    create_account
  end
end

def after_user_created(login_name)
  @logged_in_user = User.find_user(login_name)
  user_menu
end

def user_menu
  puts "Enter your command, or enter \"help\" for list of commands"
  user_command = gets.downcase.chomp
  case user_command
  when "search", '1'
    search_hero
  when "favorites", "2"
    user_menu
  when "compare", "3"
    user_menu
  when "exit", "4"
    abort("Thank you.")
  else
    puts "Invalid Command"
    user_menu
  end
end

def exit_to_main
  main_option_menu
  main_menu
end

def search_hero
  puts "Enter the Name of the Hero you would like to search."
  search_term = gets.chomp
  url_safe_search_term = search_term.split(' ').join('%20')
  url = "https://superheroapi.com/api.php/10156490789022732/search/#{url_safe_search_term}"

  response = RestClient.get(url)
  results = JSON.parse(response.body)["results"]

  if results == nil
    puts "Hero not found, try again."
    search_hero
  elsif results.length > 1
    results.each_with_index do |hero, index|
      puts "\t#{index+1}. #{hero["biography"]["full-name"]}"
    end
    i = gets.to_i-1
    hero_hash = results[i]
      hero_name = hero_hash["name"]
      hero_full_name = hero_hash["biography"]["full-name"]
      hero_gender = hero_hash["appearance"]["gender"][0]
      hero_height = hero_hash["appearance"]["height"][0]
      hero_weight = hero_hash["appearance"]["weight"][0]
      hero_birth_place = hero_hash["biography"]["place-of-birth"]
      hero_occupation = hero_hash["work"]["occupation"]
      hero_powerstats_int = hero_hash["powerstats"]["intelligence"]
      hero_powerstats_str = hero_hash["powerstats"]["strength"]
      hero_powerstats_speed = hero_hash["powerstats"]["speed"]
      hero_powerstats_power = hero_hash["powerstats"]["power"]
      hero_powerstats_combat = hero_hash["powerstats"]["combat"]
      puts "Hero: #{hero_name}"
      puts "Full Name: #{hero_full_name}"
      puts "Gender: #{hero_gender}"
      puts "Height: #{hero_height}"
      puts "Weight: #{hero_weight}"
      puts "Birth Place: #{hero_birth_place}"
      puts "Occupation(s): #{hero_occupation}"
      puts "Intelligence: #{hero_powerstats_int}"
      puts "Strength: #{hero_powerstats_str}"
      puts "Speed: #{hero_powerstats_speed}"
      puts "Power: #{hero_powerstats_power}"
      puts "Combat: #{hero_powerstats_combat}"
      puts " "
      Hero.find_or_create_by(name: hero_name, full_name: hero_full_name, gender: hero_gender, height: hero_height, weight: hero_weight, birth_place: hero_birth_place, occupation: hero_occupation, int: hero_powerstats_int, str: hero_powerstats_str, speed: hero_powerstats_speed, power: hero_powerstats_power, combat: hero_powerstats_combat)
  else
    results.each do |hero|
      hero_name = hero["name"]
      hero_full_name = hero["biography"]["full-name"]
      hero_gender = hero["appearance"]["gender"][0]
      hero_height = hero["appearance"]["height"][0]
      hero_weight = hero["appearance"]["weight"][0]
      hero_birth_place = hero["biography"]["place-of-birth"]
      hero_occupation = hero["work"]["occupation"]
      hero_powerstats_int = hero["powerstats"]["intelligence"]
      hero_powerstats_str = hero["powerstats"]["strength"]
      hero_powerstats_speed = hero["powerstats"]["speed"]
      hero_powerstats_power = hero["powerstats"]["power"]
      hero_powerstats_combat = hero["powerstats"]["combat"]
      puts "Hero: #{hero_name}"
      puts "Full Name: #{hero_full_name}"
      puts "Gender: #{hero_gender}"
      puts "Height: #{hero_height}"
      puts "Weight: #{hero_weight}"
      puts "Birth Place: #{hero_birth_place}"
      puts "Occupation(s): #{hero_occupation}"
      puts "Intelligence: #{hero_powerstats_int}"
      puts "Strength: #{hero_powerstats_str}"
      puts "Speed: #{hero_powerstats_speed}"
      puts "Power: #{hero_powerstats_power}"
      puts "Combat: #{hero_powerstats_combat}"
      puts " "
      Hero.find_or_create_by(name: hero_name, full_name: hero_full_name, gender: hero_gender, height: hero_height, weight: hero_weight, birth_place: hero_birth_place, occupation: hero_occupation, int: hero_powerstats_int, str: hero_powerstats_str, speed: hero_powerstats_speed, power: hero_powerstats_power, combat: hero_powerstats_combat)
    end
  end
    after_hero_search
end

def after_hero_search
  puts "------------------------------------------------------------------"
  puts "1. Search                               to search for another hero"
  puts "2. Add                                  to your favorite heroes list"
  puts "3. Return                               to the user menu"
  puts "4. Exit                                 exit the application"
  puts "------------------------------------------------------------------"
  user_command = gets.downcase.chomp
  case user_command
  when "search", "1"
    search_hero
  when "add", "2"
    puts "Hero added to your favorites!"
  when "return", "3"
    user_option_menu
    user_menu
  when "exit", "4"
    abort("Thank you.")
  else
    "Invalid response, try again"
  end
end
