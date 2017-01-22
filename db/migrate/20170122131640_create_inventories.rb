class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
