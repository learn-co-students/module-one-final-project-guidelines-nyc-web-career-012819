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

def user_menu
  puts "Enter your command, or enter \"help\" for list of commands"
  user_command = gets.downcase.chomp
  case user_command
  when "search", '1'
    search_hero
  when "favorites", "2"
    user_menu
  when "compare", "3"
    compare_hero
    user_option_menu
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
  search_term = gets.chomp.downcase
  create_hero(search_term)
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
      puts "#{search_term} added to your favorites!"
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
  find_by_name(hero_name)


  puts "What is the name of the second character to compare?"
  second = gets.chomp.downcase
  tp hero_array, :name, :full_name, :gender, :height, :weight, :int, :str, :speed, :power, :combat
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
