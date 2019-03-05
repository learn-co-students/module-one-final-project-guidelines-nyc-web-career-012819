require 'pry'
require 'json'
require 'http'

class CommandLineInterface

  def start
    greeting
  end

  def greeting
    puts "Welcome to Bar Finder!"
    user_name = gets.chomp.downcase
    existing_user(user_name)
  end


  def existing_user(user_name)
    if User.find_by(name: user_name)
      puts "Welcome Back #{user_name}!"
      existing_user_menu(user_name)
    else
      puts "Welcome to Bar Finder!"
      new_user_menu(user_name)
    end
  end

  def existing_user_menu(user_name)
    puts "\n
    1. find a new bar\n
    2. view your favorite bars\n
    3. delete account\n
    4. exit app\n
    Please Make a Selection:\n"
    existing_user_input = gets.chomp
    @user = User.find_by(name: user_name)
    if existing_user_input == "1"
      location_search
      puts "Please make a selection:"
    elsif existing_user_input == "2"
      view_fav_list# must write method
    elsif existing_user_input == "3"
      delete_user# write delete account
    elsif existing_user_input == "4"
      exit_app
    else
      puts "    Invalid entry!"
      existing_user_menu(user_name)
    end
  end

  def new_user_menu(user_name)
    @new_user = User.create(name: user_name)
      puts "Make a Selection:\n\n
      1. Search New bars\n
      2. Delete Account\n
      3. Exit App"
      new_user_input = gets.chomp
    if new_user_input == "1"
      location_search
    elsif new_user_input == "2"
      puts "Delete"
    elsif new_user_input == "3"
      exit_app
    else
    puts "    Invalid entry!"
    existing_user_menu(user_name)
    end
    select_bar(bar_arr)
  end


  def location_search
    puts "Please enter a location:"
    location = gets.chomp
    bar_search = ApiCommunicator.search(bar = "bar", location)
    if location == nil
      error_message
      location_search
    else
      bars_list(bar_search)
    end
  end

  def bars_list(bar_search)
    bar_arr = []
    counter = 0
    biz = bar_search["businesses"]
    biz.map do |bar|
      bar_hash = {}
      bar_hash[:name] = bar["name"]
      bar_hash[:rating] = bar["rating"]
      bar_hash[:is_closed] = bar["is_closed"]
      bar_hash[:url] = bar["url"][0..30]
      bar_hash[:address] = bar["location"]["display_address"].join(", ")
      bar_arr << bar_hash
      counter += 1
      puts "  #{counter}. Name: #{bar_hash[:name]}\n
      Rating: #{bar_hash[:rating]}\n
      Closed: #{bar_hash[:is_closed]}\n
      Website: #{bar_hash[:url]}...\n
      Address: #{bar_hash[:address]}\n\n"
    end
    bar_arr
    add_fav_list(bar_arr)
  end

  def add_fav_list(bar_arr)
    puts "\nWould you like to add a bar to favorites?\nType yes or no (y/n)"
    answer = gets.chomp.downcase
    if answer == "yes" || answer == "y"
      puts "\n Please enter your number choice 1 - 5"
      selection = gets.chomp.to_i
      bar_name = bar_arr[selection -1][:name]
      bar_rating = bar_arr[selection -1][:rating]
      bar_closed = bar_arr[selection -1][:is_closed]
      bar_url = bar_arr[selection -1][:url]
      bar_address = bar_arr[selection -1][:address]
        Bar.find_or_create_by(name: bar_name, rating: bar_rating, is_closed: bar_closed, url: bar_url, address: bar_address)
      find_user_id = User.find_by(name: @user.name).id
      Favorite.find_or_create_by(user_id: find_user_id, bar_id: Bar.find_by(name: bar_name).id)
    elsif answer == "no" || answer == "n"
      existing_user_menu(user_name)
    else
        error_message
        add_fav_list(bar_arr)
    end
    binding.pry
  end

  def view_fav_list
    counter = 1
    user_fav = @user.bars
    user_fav.map do |bar|
      name = bar.name
      rating = bar.rating
      closed = bar.is_closed
      url = bar.url
      address = bar.address
      puts "  #{counter}. Name: #{name}\n
      Rating: #{rating}\n
      Closed: #{closed}\n
      Website: #{url}...\n
      Address: #{address}\n\n"
      counter += 1
      puts "*" * 30
    end
    puts "Return to main menu? (y/n)"
    answer = gets.chomp
    if answer == "yes" || answer == "y"
      return_to_menu
      # binding.pry
      # self.existing_user_menu(@user) #needs to go back to the main menu fresh start existing_user_menu
    elsif answer == "no" || answer == "n"
      exit_app
    else
      error_message
    end

  end

  def return_to_menu
    existing_user_menu(@user.name)
  end

  def exit_app
    puts "Byeeee"

  end

  def error_message
    puts "Invalid Entry, Please Try Again!"
    self.existing_user_menu(@user.name)
  end

end
