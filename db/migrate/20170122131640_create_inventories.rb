class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.references :owner
      t.string     :location

      t.timestamps
    end
  end
end 
