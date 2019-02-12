class User < ActiveRecord::Base
  has_many :heroes
  has_many :heroes, :through => :favorites
end
