class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.references :to, polymorphic: true, index: true
      t.references :skill, polymorphic: true, index: true

      t.timestamps
    end
  end
end
