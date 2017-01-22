class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string     :name
      t.references :group, foreign_key: true
      t.references :game_master

      t.timestamps
    end
  end
end
