def welcome
  puts "                     Welcome to:
  (                                 (
)\ )                          )   )\ )                  )
(()/(                 (     ( /(  (()/(               ( /(
/(_))  `  )     (    )(    )\())  /(_))   (     (    )\())
(_))    /(/(     )\  (()\  (_))/  (_))     )\    )\  ((_)\

/ __|  ((_)_\   ((_)  ((_) | |_   | |     ((_)  ((_) | |(_)
 \__ \  | '_ \) / _ \ | '_| |  _|  | |__  / _ \ / _|  | / /
|___/  | .__/  \___/ |_|    \__|  |____| \___/ \__|  |_\_\
|_|"
end

def user_input
  puts "What team's odds would you like to see?"
  team_input = gets.chomp
  team_input
end
