class User < ActiveRecord::Base
has_many :favorites
has_many :bars, through: :favorites
end
