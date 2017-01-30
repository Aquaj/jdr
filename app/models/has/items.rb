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
  end
end
