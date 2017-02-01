FactoryGirl.define do
  factory :armour do
    factory :plaid_shirt do
      name          'Plaid Shirt'
      enc_per_unit  4
      covers        'Left arm'
      armour_points 5
      details       'Plaid'
    end
  end
end
