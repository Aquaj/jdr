class Inventory < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
