class Hero < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  def create_hero(search_term)
    url_safe_search_term = search_term.split(' ').join('%20')
    url = "https://superheroapi.com/api.php/10156490789022732/search/#{url_safe_search_term}"

    response = RestClient.get(url)
    results = JSON.parse(response.body)["results"]

    if results == nil
      puts "Hero not found, try again."
      search_hero
    elsif results.length > 1
      results.each_with_index do |hero, index|
        puts "\t#{index+1}. #{hero["biography"]["full-name"]}"
      end
      i = gets.to_i-1
      hero = results[i]
      get_make_hero(hero)
    else
      results.each do |hero|
        get_make_hero(hero)
      end
    end
  end

  def get_make_hero(hero)
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
    hero = Hero.find_or_create_by(name: hero_name, full_name: hero_full_name, gender: hero_gender, height: hero_height, weight: hero_weight, birth_place: hero_birth_place, occupation: hero_occupation, int: hero_powerstats_int, str: hero_powerstats_str, speed: hero_powerstats_speed, power: hero_powerstats_power, combat: hero_powerstats_combat)
    tp hero
    puts " "
  end

  def find_by_name(hero_name)
    hero = Hero.find_by('lower(name) = :name', name: hero_name)
    binding.pry
    hero ? hero : nil
    #   hero = hero_array << Hero.find_by('lower(name) = ?', hero_name)
    # elsif
    #   search_term = first
    #   create_hero(search_term)
    #   hero_array << Hero.find_by('lower(name) = ?', first)
    # end
  end
end
