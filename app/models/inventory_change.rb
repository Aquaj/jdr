class InventoryChange < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :inventory
end
