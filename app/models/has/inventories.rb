module Has
  module Inventories
    extend ActiveSupport::Concern

    included do
      has_items

      has_many :inventories, as: :owner
      has_many :inventory_changes, through: :inventories
    end

    def inventory place = nil
      return items unless place
      located = inventories.find_by location: place
      located.items
    end

    def add_to_inventory location, stuff
      located = inventories.find_by location: location
      located.add stuff
    end
  end
end
