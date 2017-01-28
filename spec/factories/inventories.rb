FactoryGirl.define do
  factory :inventory do
    factory :bag do
      location :bag

      after(:find_or_create) do |bag|
        find_or_create(:inventory_change, item_id: find_or_create(:candles), inventory_id: bag)
      end
    end

    factory :horsebags do
      location :horsebags

      after(:find_or_create) do |horsebags|
        find_or_create(:inventory_change, item_id: find_or_create(:plaid_shirt), inventory_id: horsebags)
        find_or_create(:inventory_change, item_id: find_or_create(:big_mace), inventory_id: horsebags)
      end
    end
  end
end
