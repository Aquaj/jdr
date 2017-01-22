class CreateCareerChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :career_changes do |t|
      t.references :from
      t.references :to
      t.references :character, foreign_key: true

      t.string     :reason

      t.timestamps
    end
  end
end
