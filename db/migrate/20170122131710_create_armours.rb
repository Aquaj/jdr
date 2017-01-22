class CreateArmours < ActiveRecord::Migration[5.0]
  def change
    create_table :armours do |t|
      t.string  :name
      t.integer :enc
      t.string  :covers
      t.integer :armour_points

      t.timestamps
    end
  end
end
