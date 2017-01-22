class CreateSkillsets < ActiveRecord::Migration[5.0]
  def change
    create_table :skillsets do |t|
      t.references :career, foreign_key: true

      t.timestamps
    end
  end
end
