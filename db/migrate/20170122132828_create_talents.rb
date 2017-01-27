class CreateTalents < ActiveRecord::Migration[5.0]
  def change
    create_table :talents do |t|
      t.string     :name

      t.timestamps
    end
  end
end
