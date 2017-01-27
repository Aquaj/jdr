class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.references :owner
      t.references :skill

      t.timestamps
    end
  end
end
