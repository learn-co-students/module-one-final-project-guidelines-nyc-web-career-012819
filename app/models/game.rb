class Game < ActiveRecord::Base

  has_many :betting_odds
  has_many :websites, through: :betting_odds

end
