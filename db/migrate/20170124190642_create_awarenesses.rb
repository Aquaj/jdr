class CreateAwarenesses < ActiveRecord::Migration[5.0]
  def change
    create_table :awarenesses do |t|
      t.references :user, foreign_key: true
      t.references :fact

      t.timestamps
    end
  end
end
