class Favorite < ActiveRecord::Base
  belongs_to :hero
  belongs_to :user
end
