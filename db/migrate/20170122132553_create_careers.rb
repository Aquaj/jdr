class CreateCareers < ActiveRecord::Migration[5.0]
  def change
    create_table :careers do |t|
      t.references :stat_bonus_set, foreign_key: true
      t.string     :name
      t.string     :nature

      t.timestamps
    end
  end
end
