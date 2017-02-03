module Managers
  class InventoryManager < Manager
    needs_from_owner :items
    needs_from_owner :inventories

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
