class Inventory < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many   :inventory_changes
end
