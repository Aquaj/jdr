FactoryGirl.define do
  factory :bag, class: :inventory do
    location :bag

    after do |bag|
      create(:inventory_change, item_id: create(:candles), inventory_id: bag)
    end
  end

  factory :horsebags, class: :inventory do
    location :horsebags

    after do |horsebags|
      create(:inventory_change, item_id: create(:plaid_shirt), inventory_id: horsebags)
      create(:inventory_change, item_id: create(:big_mace), inventory_id: horsebags)
    end
  end
end
