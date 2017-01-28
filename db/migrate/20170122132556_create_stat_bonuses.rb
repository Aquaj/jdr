class CreateStatBonuses < ActiveRecord::Migration[5.0]
  def change
    create_table :stat_bonuses do |t|
      t.references :career, foreign_key: true
      t.references :stat, foreign_key: true
      t.integer    :amount
      t.string     :reason
      t.string     :context

      t.timestamps
    end
  end
end
