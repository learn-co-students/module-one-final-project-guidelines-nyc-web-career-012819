
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

def team_include?
  user_team = user_input
  if !Game.all_teams.include?(user_team)
    puts "Sorry your team is not playing today!! "
    team_include?
  else
    user_team
  end
end

def get_websites_and_odds_of_the_game(team_name)

  # puts BettingOdd.all.where("game_id.team1 = team_name")
  # binding.pry
  # .odds website_id.name
  puts Game.all.find_by(:team1 == team_name || :team2 == team_name).websites.each do |website|
    puts website.name
  end
  # puts Game.all.find_by(:team1 == team_name || :team2 == team_name).odds
end

# find all the odds that have the same game id
# def get_websites_and_odds_of_the_game(team_name)
#   Game.all.find_by(:team1 == team_name || :team2 == team_name)
# end
