FactoryGirl.define do
  factory :thing do
    name          'Burger King'  
    unit          'bks'
    details       'Wrapped'
    quantity      '15'
    enc_per_unit  1
    localization  'In the bag'
  end
end
