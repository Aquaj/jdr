class Inventory < ApplicationRecord
  has_items

  belongs_to :owner, polymorphic: true
  has_many   :inventory_changes

  def add_items stuff
    stuff.each do |item, amount|
      inventory_changes.create! item: item, amount: amount
    end
  end
  alias add add_items
end
