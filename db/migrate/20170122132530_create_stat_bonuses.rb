class CreateStatBonuses < ActiveRecord::Migration[5.0]
  def change
    create_table :stat_bonuses do |t|
      t.references :origin
      t.integer    :amount
      t.string     :reason
      t.string     :context

      t.timestamps
    end
  end
end
