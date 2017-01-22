class CreateTalents < ActiveRecord::Migration[5.0]
  def change
    create_table :talents do |t|
      t.string     :name
      t.references :stat_bonus

      t.timestamps
    end
  end
end
