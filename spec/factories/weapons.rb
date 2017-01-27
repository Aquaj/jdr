FactoryGirl.define do
  factory :big_mace, class: :weapon do
    name        'Big Mace'
    enc         1
    group       'Bludgeons'
    damage      '1d+5'
    reach       '1m'
    reload      ''
    details     'Big AF'
    attributes  'Big'
  end
end
