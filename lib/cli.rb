require 'pry'
require 'json'
require 'http'

class CommandLineInterface
  def start
    puts "*" * 100
    greeting
    puts "*" * 100
  end

  def greeting
    puts '                Welcome to Bar Finder!'
    puts '                Please Enter Your Username:'
    @user_name = gets.chomp.downcase
    existing_user
  end

  def existing_user
    if User.find_by(name: @user_name)
      puts "*" * 100
      puts "             Welcome Back #{@user_name}!\n"
      existing_user_menu
    else
      puts '               Welcome to Bar Finder!'
      new_user_menu
    end
  end

  def existing_user_menu
    puts "                Welcome to Main Menu!"
    puts "*" * 100
    puts "\n
                          1. find a new bar\n
                          2. view your favorite bars\n
                          3. exit app\n
      Please Make a Selection:\n"
    existing_user_input = gets.chomp
    @user = User.find_by(name: @user_name)
    if existing_user_input == '1'
      location_search
      # puts 'Please make a selection:'
    elsif existing_user_input == '2'
      system "clear"
      view_fav_list
    elsif existing_user_input == '3'
      exit_app
    else
      error_message
    end
  end

  def new_user_menu
    @new_user = User.create(name: @user_name)
    puts "                Make a Selection:\n\n
                          1. Search New bars\n
                          2. Exit App"
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
    puts '                Search Your Bar with Zip Code or City Name:'
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
      puts "  #{counter}. Name: #{bar_hash[:name]}
      Rating: #{bar_hash[:rating]}
      Closed: #{bar_hash[:is_closed]}
      Website: #{bar_hash[:url]}...
      Address: #{bar_hash[:address]}\n"
      puts '*' * 100
    end
    @bar_arr
    add_fav_list
    system "clear"
  end

  def add_fav_list
    puts "\nWould you like to add a bar to favorites?\nType yes or no (y/n)"
    answer = gets.chomp.downcase
    if answer == 'yes' || answer == 'y'
      puts "\n Please choose the bar you like:"
      selection = gets.chomp.to_i
      bar_name = @bar_arr[selection - 1][:name]
      bar_rating = @bar_arr[selection - 1][:rating]
      bar_closed = @bar_arr[selection - 1][:is_closed]
      bar_url = @bar_arr[selection - 1][:url]
      bar_address = @bar_arr[selection - 1][:address]
      Bar.find_or_create_by(name: bar_name, rating: bar_rating, is_closed: bar_closed, url: bar_url, address: bar_address)
      find_user = User.find_by(name: @user_name).id
      Favorite.find_or_create_by(user_id: find_user, bar_id: Bar.find_by(name: bar_name).id)
      puts 'Would you like to view your favorites?(y/n)'
      answer2 = gets.chomp.downcase
      if answer2 == 'yes' || answer2 == 'y'
        system "clear"
        view_fav_list
      elsif answer2 == 'no' || answer2 == 'n'
        return_to_menu
      end
    elsif answer == 'no' || answer == 'n'
      existing_user_menu
    else
      error_message
    end
  end

  def view_fav_list
    counter = 1
    @user_fav = User.find_by(name: @user_name).bars
    @user_fav.map do |bar|
      name = bar.name
      rating = bar.rating
      closed = bar.is_closed
      url = bar.url
      address = bar.address
      puts "  #{counter}. Name: #{name}
      Rating: #{rating}
      Closed: #{closed}
      Website: #{url}...
      Address: #{address}\n"
      counter += 1
      puts '*' * 100
    end
    puts 'Would you like to remove a favorite from the list? (y/n)'
    answer = gets.chomp.downcase
    if answer == 'yes' || answer == 'y'
      delete_fav_bar
    elsif answer == 'no' || answer == 'n' # maybe delete fav? or delete account ?
      return_to_menu
    else
      error_message
    end
  end

  def return_to_menu
     system "clear"
    existing_user_menu
  end

  def delete_fav_bar
    puts 'Please Select the one you would like to remove:'
    selection = gets.chomp.to_i
    bar_name = @user_fav[selection - 1][:name]
    find_user = User.find_by(name: @user_name).id
    find_bar = Bar.find_by(name: bar_name).id
    find_fav = Favorite.find_by(user_id: find_user, bar_id: find_bar)
    find_fav.destroy
    return_to_menu
  end

  def exit_app
    system "clear"
    puts "                Thank you for using Bar Finder!\n
                  Hope to See You Again!"
  end


  def error_message
    puts 'Invalid Entry, Please Try Again!'
    return_to_menu
  end
end # Class end
