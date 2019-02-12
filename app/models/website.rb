class Website < ActiveRecord::Base

  has_many :betting_odds
  has_many :teams, through: :betting_odds

end
