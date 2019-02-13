class User < ActiveRecord::Base
  has_many :favorites
  has_many :heros, through: :favorites

  def self.create_user(user_name)
    self.create(name: user_name)
  end

  def self.find_user(login_name)
    self.find_by(name: login_name)
  end
end
