class Hero < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  def self.find_or_create_hero(hero_name)
    # search db
    if hero = Hero.find_by('lower(name) = :name', name: hero_name)
      tp hero, :name, :full_name, :gender, :height, :weight, :int, :str, :speed, :power, :combat
      hero # hero in database
    elsif !hero && api_response = Hero.api_request(hero_name)
      Hero.get_make_hero(api_response) # hero not in database but found in api
    else
      puts "No hero found, check spelling." # no hero was found
    end
  end

  def self.get_make_hero(hero)
    hero_name = hero["name"]
    hero_full_name = hero["biography"]["full-name"]
    hero_gender = hero["appearance"]["gender"][0]
    hero_height = hero["appearance"]["height"][0]
    hero_weight = hero["appearance"]["weight"][0]
    hero_birth_place = hero["biography"]["place-of-birth"]
    hero_occupation = hero["work"]["occupation"]
    hero_powerstats_int = hero["powerstats"]["intelligence"]
    hero_powerstats_str = hero["powerstats"]["strength"]
    hero_powerstats_speed = hero["powerstats"]["speed"]
    hero_powerstats_power = hero["powerstats"]["power"]
    hero_powerstats_combat = hero["powerstats"]["combat"]
    puts " "
    hero = Hero.find_or_create_by(
      name: hero_name,
      full_name: hero_full_name,
      gender: hero_gender,
      height: hero_height,
      weight: hero_weight,
      birth_place: hero_birth_place,
      occupation: hero_occupation,
      int: hero_powerstats_int,
      str: hero_powerstats_str,
      speed: hero_powerstats_speed,
      power: hero_powerstats_power,
      combat: hero_powerstats_combat
    )
    tp hero, :name, :full_name, :gender, :height, :weight, :int, :str, :speed, :power, :combat
    puts " "
    return hero
  end

  # def self.find_by_name(hero_name)
  #   if hero = Hero.find_by('lower(name) = :name', name: hero_name)
  #     hero
  #   elsif !hero && api_response = Hero.api_request(hero_name)
  #     Hero.get_make_hero(api_response[0])
  #   else
  #     puts "Hero not found, check your spelling."
  #   end
  #   #check database first
  #   #check API next
  #   #if not in api or database, hero not found
  # end


  private
  def self.api_request(search_term)
    if search_term.match(/^[[:alpha:][:blank:]]+$/)
      url_safe_search_term = search_term.split(' ').join('%20')
      url = "https://superheroapi.com/api.php/10156490789022732/search/#{url_safe_search_term}"

      response = RestClient.get(url)
      results = JSON.parse(response.body)["results"]
      if results && results.length > 1
        results.each_with_index do |hero, index|
          puts "\t#{index+1}. #{hero["biography"]["full-name"]}"
        end
        i = gets.to_i-1
        results[i]

      elsif results && results.length == 1
        results[0] #single result
      else
        return nil #error path
      end
    end
  end
end
