class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.references :skillset, foreign_key: true
      t.references :skill

      t.timestamps
    end
  end
end
