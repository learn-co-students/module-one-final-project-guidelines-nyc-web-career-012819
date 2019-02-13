def main_menu
  puts " "
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
    user_menu
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
