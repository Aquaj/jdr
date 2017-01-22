class CreateWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|
      t.string  :name
      t.integer :enc
      t.string  :group
      t.integer :damage
      t.integer :reach
      t.string  :reload
      t.text    :attributes
      t.text    :details

      t.timestamps
    end
  end
end
