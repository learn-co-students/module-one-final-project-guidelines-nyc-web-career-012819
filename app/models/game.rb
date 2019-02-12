class Game < ActiveRecord::Base

  has_many :betting_odds
  has_many :websites, through: :betting_odds

  def teams
    [team1, team2]
  end

  def self.all_teams
    self.all.map do |game|
      game.teams
    end.flatten.uniq
  end

  

end
