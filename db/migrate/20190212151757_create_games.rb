class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :team1
      t.string :team2
      t.string :sport_key
      t.datetime :game_date
    end
  end
end
