require_relative '../app/models/hero.rb'

def main_menu
  puts " "
  puts "Enter Your Command"
  user_command = gets.chomp.downcase

  case user_command
  when "login", '1'
    login_process
  when "create account", '2'
    create_account
  when "exit", '3'
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
    after_user_created(login_name)
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
    after_user_created(user_name)
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

def show_favorites
 Favorite.all.each do |favorites|
   id_user = User.where(name: @logged_in_user["name"]).pluck(:id)
   if favorites.user_id == id_user[0]
     Hero.all.each do |hero|
       if favorites.hero_id == hero.id
         puts "#{hero.name}"
       end
     end
   end
 end
 sleep 1
 puts " "
 puts "Would you like to delete any of your favorites?"
 puts "Yes or No?"
 user_input = gets.chomp.downcase
 case user_input
 when "yes", "y"
   puts "Who do you want to delete?"
   hero_input = gets.chomp.downcase
   id_hero = Hero.where('lower(name) = ?', hero_input).pluck(:id)
   id_user = User.where(name: @logged_in_user["name"]).pluck(:id)
   Favorite.delete(Favorite.all.find_by('hero_id = ? AND user_id = ?', id_hero[0], id_user[0]))
   puts "Character deleted!"
   sleep 1
   user_option_menu
   user_menu
 when "no", "no"
   user_option_menu
   user_menu
 else
   puts " "
   puts "Try again."
   puts " "
   sleep 1
   show_favorites
 end
end

def user_menu
  puts "Enter your command."
  user_command = gets.downcase.chomp
  case user_command
  when "search", '1'
    search_hero
  when "favorites", "2"
    puts " "
    show_favorites
  when "compare", "3"
    compare_hero
    user_option_menu
    user_menu
  when "delete", '4'
    delete_user
  when "exit", "5"
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
  search_term = gets.chomp.downcase

  hero = Hero.find_or_create_hero(search_term)
  if !hero
    search_hero
  end
  puts " "
  puts "Would you like to add to your Favorites?"
  puts "Type Yes to add to your Favorites."
  puts "Type No to return to the user menu."
  puts " "
  input = gets.chomp.downcase

  case input
  when "y", "yes"
    id_user = User.where(name: @logged_in_user["name"]).pluck(:id)
    id_hero = Hero.where('lower(name) = ?', search_term).pluck(:id)
    Favorite.create(user_id: id_user[0], hero_id: id_hero[0])
    puts "Added to your favorites!"
  when "n", "no"
    after_hero_search
  else
    "Invalid response, try Yes or No."
  end

  after_hero_search
end

def compare_hero
  hero_array = []
  puts "What is the name of the first character you want to compare?"
  hero_name = gets.chomp.downcase

  hero_array << Hero.find_or_create_hero(hero_name)


  puts "What is the name of the second character to compare?"
  hero_name = gets.chomp.downcase
  hero_array << Hero.find_or_create_hero(hero_name)
  tp hero_array, :name, :full_name, :gender, :height, :weight, :int, :str, :speed, :power, :combat
end

def delete_user
  puts "Are you sure you want to delete your user name?"
  puts "Yes or No?"
  user_input = gets.chomp.downcase
  case user_input
  when 'yes', 'y'
    User.delete(User.all.find_by(name: @logged_in_user["name"]))
    puts "User deleted!"
    sleep 2
    main_option_menu
    main_menu
  when 'no', 'n'
    user_option_menu
    user_menu
  end
end

def after_hero_search
  after_hero_menu
  user_command = gets.downcase.chomp
  case user_command
  when "search", "1"
    search_hero
  when "return", "2"
    user_option_menu
    user_menu
  when "exit", "3"
    abort("Thank you.")
  else
    "Invalid response, try again"
  end
end
