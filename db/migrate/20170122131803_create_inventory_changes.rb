class CreateInventoryChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_changes do |t|
      t.references :item
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
