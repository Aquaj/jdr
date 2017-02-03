module Managers
  class ItemManager < Manager
    needs_from_owner :things, :armours, :weapons
    needs_from_owner :inventory_changes

    def items
      armours +
        things +
        weapons
    end

    def enc
      items.sum { |item| enc_for item }
    end

    def enc_for item
      item.enc_per_unit * quantity_of(item)
    end

    def quantity_of item
      inventory_changes.where(item: item).sum(:amount)
    end
  end
end
