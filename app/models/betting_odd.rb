class BettingOdd < ActiveRecord::Base

  belongs_to :website
  belongs_to :team

end
