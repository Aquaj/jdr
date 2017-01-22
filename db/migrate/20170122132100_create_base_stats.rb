class CreateBaseStats < ActiveRecord::Migration[5.0]
  def change
    create_table :base_stats do |t|
      t.references :stat, foreign_key: true
      t.integer    :value

      t.timestamps
    end
  end
end
