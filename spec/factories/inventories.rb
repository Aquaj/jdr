FactoryGirl.define do
  factory :inventory do
    factory :bag do
      location :bag

      after :create do |bag|
        add_items candles: 5, to: bag
      end
    end

    factory :horsebags do
      location :horsebags

      after :create do |horsebags|
        add_items plaid_shirt: 1,
                  big_mace: 1,
                  to: horsebags
      end
    end
  end
end

def add_items(**items)
  to = items.delete :to
  items.each do |item, quantity|
    add_item item, quantity, to
  end
end

def add_item(item, quantity, to)
  find_or_create(:inventory_change,
                 item: find_or_create(item),
                 amount: quantity,
                 inventory: to)
end
