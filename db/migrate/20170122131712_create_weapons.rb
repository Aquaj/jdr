class CreateWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|
      t.string  :name
      t.integer :enc_per_unit
      t.string  :group
      t.integer :damage
      t.integer :reach
      t.string  :reload_info
      t.text    :qualities
      t.text    :details

      t.timestamps
    end
  end
end
