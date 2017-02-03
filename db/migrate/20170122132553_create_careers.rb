class CreateCareers < ActiveRecord::Migration[5.0]
  def change
    create_table :careers do |t|
      t.string  :name
      t.string  :nature
      t.boolean :secret

      t.timestamps
    end
  end
end
