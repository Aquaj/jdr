module Has
  module Items
    extend ActiveSupport::Concern

    included do
      with_options through: :inventory_changes, source: :item do
        has_many   :things,  source_type: 'Thing'
        has_many   :armours, source_type: 'Armour'
        has_many   :weapons, source_type: 'Weapon'
      end
    end

    def items
      armours + things + weapons
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
