class CreateStatBonusSets < ActiveRecord::Migration[5.0]
  def change
    create_table :stat_bonus_sets do |t|

      t.timestamps
    end
  end
end
