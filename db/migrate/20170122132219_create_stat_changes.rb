class CreateStatChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :stat_changes do |t|
      t.references :base_stat, foreign_key: true
      t.integer    :amount
      t.references :origin, polymorphic: true, index: true

      t.timestamps
    end
  end
end
