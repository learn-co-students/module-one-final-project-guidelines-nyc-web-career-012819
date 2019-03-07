require 'pry'
require 'json'
require 'http'
require 'colorize'

class CommandLineInterface

  def start
    @pid = fork{ exec 'afplay', "1-02 Thinkin Bout You.mp3" }
    system "clear"
    greeting
  end

  def greeting
    puts '
         WELCOME TO BAR FINDER!'.colorize(:green)
    puts '
  Please Enter or Create a Username:'.colorize(:green)
    @user_name = gets.chomp.downcase
    existing_user
  end

  def existing_user
    if User.find_by(name: @user_name)
      puts "\n\nWelcome Back #{@user_name.capitalize}!\n".colorize(:green)
      existing_user_menu
    else
      new_user_menu
    end
  end

  def existing_user_menu
    puts "*** MAIN MENU ***".colorize(:green)
    puts "\n
1. Find a New Bar\n
2. View Favorite Bars\n
3. Exit\n\n
Please Make a Selection:\n".colorize(:green)
    existing_user_input = gets.chomp
    @user = User.find_by(name: @user_name)
    if existing_user_input == '1'
      location_search
      # puts 'Please make a selection:'
    elsif existing_user_input == '2'
      view_fav_list
    elsif existing_user_input == '3'

      exit_app
    else
      error_message
    end
  end

  def new_user_menu
    @new_user = User.create(name: @user_name)
    puts "Please Make a Selection:\n\n
1. Search for New Bars\n
2. Exit".colorize(:green)
    new_user_input = gets.chomp
    if new_user_input == '1'
      location_search
    elsif new_user_input == '2'
      exit_app
    else
      error_message
    end
  end

  def location_search
    puts 'Find a Bar by Zipcode or City Name:'.colorize(:green)
    location = gets.chomp
    bar_search = ApiCommunicator.search(bar = 'bar', location)
    if location.nil?
      error_message
      location_search
    else
      bars_list(bar_search)
    end
  end

  def bars_list(bar_search)
    @bar_arr = []
    counter = 0
    biz = bar_search['businesses']
    biz.map do |bar|
      bar_hash = {}
      bar_hash[:name] = bar['name']
      bar_hash[:rating] = bar['rating']
      bar_hash[:is_closed] = bar['is_closed']
      bar_hash[:url] = bar['url'][0..30]
      bar_hash[:address] = bar['location']['display_address'].join(', ')
      @bar_arr << bar_hash
      counter += 1
  puts "#{counter}. Name: #{bar_hash[:name]}
   Rating: #{bar_hash[:rating]}
   Closed: #{bar_hash[:is_closed]}
   Website: #{bar_hash[:url]}...
   Address: #{bar_hash[:address]}\n".colorize(:green)
   puts "-" * 80
    end
    @bar_arr
    add_fav_list

  end

  def add_fav_list
    puts "\nWould you like to add a bar to favorites?\nType yes or no (y/n)\n".colorize(:green)
    answer = gets.chomp.downcase
    if answer == 'yes' || answer == 'y'
      puts "Please enter 1-5 for your choice bar:".colorize(:green)
      selection = gets.chomp.to_i
      bar_name = @bar_arr[selection - 1][:name]
      bar_rating = @bar_arr[selection - 1][:rating]
      bar_closed = @bar_arr[selection - 1][:is_closed]
      bar_url = @bar_arr[selection - 1][:url]
      bar_address = @bar_arr[selection - 1][:address]
      Bar.find_or_create_by(name: bar_name, rating: bar_rating, is_closed: bar_closed, url: bar_url, address: bar_address)
      find_user = User.find_by(name: @user_name).id
      Favorite.find_or_create_by(user_id: find_user, bar_id: Bar.find_by(name: bar_name).id)
      puts 'Would you like to view your favorites?(y/n)'.colorize(:green)
      answer2 = gets.chomp.downcase
        if answer2 == 'yes' || answer2 == 'y'
        view_fav_list
        elsif answer2 == 'no' || answer2 == 'n'
        return_to_menu
        end
      elsif answer == 'no' || answer == 'n'
        system "clear"
          existing_user_menu
      else
      error_message
    end
  end

  def view_fav_list
    system "clear"
    counter = 1
    @user_fav = User.find_by(name: @user_name).bars
    @user_fav.map do |bar|
      name = bar.name
      rating = bar.rating
      closed = bar.is_closed
      url = bar.url
      address = bar.address
      puts "#{counter}. Name: #{name}
   Rating: #{rating}
   Closed: #{closed}
   Website: #{url}...
   Address: #{address}\n".colorize(:green)
      counter += 1
      puts "-" * 80
    end
    puts 'Would you like to remove a favorite from the list? (y/n)'.colorize(:green)
    answer = gets.chomp.downcase
    if answer == 'yes' || answer == 'y'
      delete_fav_bar
    elsif answer == 'no' || answer == 'n' # maybe delete fav? or delete account ?
      system "clear"
      return_to_menu
    else
      error_message
    end
  end

  def return_to_menu
    existing_user_menu
  end

  def delete_fav_bar
    puts 'Please Select the one you would like to remove:'.colorize(:green)
    selection = gets.chomp.to_i
    bar_name = @user_fav[selection - 1][:name]
    find_user = User.find_by(name: @user_name).id
    find_bar = Bar.find_by(name: bar_name).id
    find_fav = Favorite.find_by(user_id: find_user, bar_id: find_bar)
    find_fav.destroy
    view_fav_list
    # return_to_menu
  end

  def exit_app
    Process.kill("SIGKILL", @pid)
    puts "\n\n\n         Thank you for using Bar Finder! Please Drink Responsibly :)\n\n\n".colorize(:green)
  end


  def error_message
    system "clear"
    puts "Invalid Entry!\n\n".colorize(:green)
    return_to_menu
  end
end # Class end
