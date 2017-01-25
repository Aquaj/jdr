class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.references :player, foreign_key: true
      t.string     :name
      t.string     :race
      t.integer    :height
      t.integer    :weight
      
      t.integer    :age
      t.string     :gender
      t.string     :sign
      t.string     :eye_color
      t.string     :hair_color
      t.string     :birth_place
      t.integer    :siblings
      t.string     :notable_details

      t.text       :notes

      t.timestamps
    end
  end
end
