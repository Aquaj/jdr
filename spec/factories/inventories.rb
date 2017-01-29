FactoryGirl.define do
  factory :inventory do
    factory :bag do
      location :bag

      after :create do |bag|
        add_item :candles, to: bag
      end
    end

    factory :horsebags do
      location :horsebags

      after :create do |horsebags|
        add_item :plaid_shirt, to: horsebags
        add_item :big_mace,    to: horsebags
      end
    end
  end
end

def add_item(item, to: nil)
  find_or_create(:inventory_change,
                 item: find_or_create(item),
                 inventory: to)
end
