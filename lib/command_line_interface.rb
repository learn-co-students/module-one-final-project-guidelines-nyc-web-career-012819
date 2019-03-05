
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

# def user_input
#   puts "What team's odds would you like to see?"
#   team_input = gets.chomp
#   team_input
# end

def team_include?
  puts "What team's odds would you like to see?"
  the_input = gets.chomp
  if !Game.all_teams.include?(the_input)
    puts "Sorry your team is not playing today!! "
    team_include?
  else
    the_input
  end

end

def all_games_ids(teamm)
  games = []
  # games_team1 = Game.all.where(team1: team_include?)
  # games_team2 = Game.all.whereteam2: team_include?)
  Game.all.each do |game|
    if game.team1.include?(teamm) || game.team2.include?(teamm)
      games << game.id
    end
  end
  #for all the game ids that exist in betting odds, return the odds instance
  games
end

# def all_web_ids(teamm)
#   games = []
#   # games_team1 = Game.all.where(team1: team_include?)
#   # games_team2 = Game.all.whereteam2: team_include?)
#   Game.all.each do |game|
#     if game.team1.include?(teamm) || game.team2.include?(teamm)
#       games << game.id
#     end
#   end
#   #fiterate through all the websites, get all the
#   #if the betting odd includes the website_id AND Game_id
#   games
# end


def get_the_stuff(ids_array)
  final = []
  final1 = []
  Website.all_websites_ids.each do |site_id_a|
  ids_array.each do |id|
  BettingOdd.all.each do |bet_info|
    if bet_info.game_id == id && bet_info.website_id == site_id_a
      final << Website.all_websites_names[site_id_a-1]
      final << bet_info.odds
      final << ""
      final1 << Website.all_websites_names[site_id_a-1]
      final1 << bet_info.odds
    end
    end
  end
end
puts "The sportsbooks and their respective odds:"
puts ""
final.each {|el| puts el}
end


# def get_websites_and_odds_of_the_game(team_name)
# games = all_games_team(team_name)

# prints out names of all sites!!!!!!!
  #  Game.all.find_by(:team1 == team_name).websites.each do |website|
  #   puts website.name
  # end
  # puts games
  # puts Game.all.find_by(:team1 == team_name || :team2 == team_name).odds
# end


# find all the odds that have the same game id
# def get_websites_and_odds_of_the_game(team_name)
#   Game.all.find_by(:team1 == team_name || :team2 == team_name)
# end
