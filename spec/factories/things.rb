FactoryGirl.define do
  factory :thing do
    factory :candles do
      name          'Candles'  
      unit          ''
      details       'Scented'
      quantity      '5'
      enc_per_unit  1
    end

    factory :burger_king do
      name          'Burger King'  
      unit          'bks'
      details       'Wrapped'
      quantity      '15'
      enc_per_unit  1
    end
  end
end
