class Website < ActiveRecord::Base

  has_many :betting_odds
  has_many :games, through: :betting_odds

  def websites
    name
  end

  def self.all_websites_ids
    self.all.map do |site|
      site.id
    end.flatten.uniq
  end

  def self.all_websites_names
    self.all.map do |site|
      site.name
    end.flatten.uniq
  end

end
