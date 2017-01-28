class Thing < ApplicationRecord
  has_many :inventory_changes, as: :item
end
