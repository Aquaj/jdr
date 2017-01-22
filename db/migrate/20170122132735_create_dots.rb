class CreateDots < ActiveRecord::Migration[5.0]
  def change
    create_table :dots do |t|
      t.references :career, foreign_key: true
      t.string     :name
      t.text       :details

      t.timestamps
    end
  end
end
