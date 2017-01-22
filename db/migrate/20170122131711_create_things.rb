class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.integer :quantity
      t.string  :unit
      t.string  :name
      t.integer :enc_per_unit
      t.string  :localization
      t.text    :details

      t.timestamps
    end
  end
end
