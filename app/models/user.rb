class User < ActiveRecord::Base
  has_many :favorites
  has_many :heros, through: :favorites
end
