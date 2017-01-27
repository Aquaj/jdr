FactoryGirl.define do
  factory :plaid_shirt, class: :armour do
    name           'Plaid shirt'
    enc           4
    covers        'Left arm'
    armour_points 5
    details       'Plaid'
  end
end
