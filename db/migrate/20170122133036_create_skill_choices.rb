class CreateSkillChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_choices do |t|
      t.references :career, foreign_key: true

      t.timestamps
    end
  end
end
