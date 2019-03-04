require 'pry'
require 'json'
require 'http'

class CommandLineInterface

  def start
    welcome
    user_login
  end

  def welcome
    bar_search = ApiCommunicator.search("bar", "10002")
    binding.pry
    puts "Hello :)"
    # Please enter your name
  end

  def user_login
    #create a new user
    #puts statement
  end

  def menu
    #options
    #1 Search Bars, 2 Add to Favorites 3 View Favorites 4 Delete
  end









end
