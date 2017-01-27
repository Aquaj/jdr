FactoryGirl.define do
  factory :character do
    factory :zendark do
      player factory: :tonio

      name        'Zendark'
      race        'Gay'
      sign        'Zodiac'
      gender      'None'
      weight      90
      height      185
      eye_color   'Deep'
      hair_color  'Polychromatic'

      siblings        '3 - 1 brother, 2 sisters'
      birth_place     'The Void'
      notable_details 'Scar'


      after(:create) do |zendark|
        create(:base_strength, character_id: zendark)
        create(:base_agility, character_id: zendark)
      end
    end
  end
end
