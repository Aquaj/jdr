class CreateParentages < ActiveRecord::Migration[5.0]
  def change
    create_table :parentages do |t|
      t.references :source_carreer
      t.references :leads_to

      t.timestamps
    end
  end
end
