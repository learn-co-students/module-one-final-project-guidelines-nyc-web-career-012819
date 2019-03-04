class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.float :rating
      t.boolean :is_closed
      t.string :url
      t.string :address
    end
  end
end
