class CreateBettingOdds < ActiveRecord::Migration[5.0]
  def change
    create_table :betting_odds do |t|
      t.integer :website_id
      t.integer :game_id
      t.string :odds
    end
  end
end
