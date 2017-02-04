class Inventory < ApplicationRecord
  has_items

  belongs_to :owner, polymorphic: true, optional: true
  has_many   :inventory_changes

  with_options through: :inventory_changes, source: :item do
    has_many   :things,  source_type: 'Thing'
    has_many   :armours, source_type: 'Armour'
    has_many   :weapons, source_type: 'Weapon'
  end

  def add_items stuff
    stuff.each do |item, amount|
      inventory_changes.create! item: item, amount: amount
    end
  end
  alias add add_items
end
