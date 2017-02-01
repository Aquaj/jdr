FactoryGirl.define do
  factory :weapon do
    factory :big_mace do
      name         'Big Mace'
      enc_per_unit 1
      group        'Bludgeons'
      damage       '1d+5'
      reach        '1m'
      reload_info  ''
      details      'Big AF'
      qualities    'Big'
  end
  end
end
