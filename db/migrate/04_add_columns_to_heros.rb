class AddColumnsToHeros < ActiveRecord::Migration[5.0]
  def change
    add_column :heros, :full_name, :string
    add_column :heros, :gender, :string
    add_column :heros, :height, :string
    add_column :heros, :weight, :string
    add_column :heros, :birth_place, :string
    add_column :heros, :occupation, :string
    add_column :heros, :int, :string
    add_column :heros, :str, :string
    add_column :heros, :speed, :string
    add_column :heros, :power, :string
    add_column :heros, :combat, :string
  end
end
