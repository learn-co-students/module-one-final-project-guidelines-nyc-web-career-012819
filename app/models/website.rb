class Website < ActiveRecord::Base

  has_many :betting_odds
  has_many :games, through: :betting_odds

end
