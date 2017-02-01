class CreateArmours < ActiveRecord::Migration[5.0]
  def change
    create_table :armours do |t|
      t.string  :name
      t.integer :enc_per_unit
      t.string  :covers
      t.integer :armour_points
      t.text    :details

      t.timestamps
    end
  end
end
