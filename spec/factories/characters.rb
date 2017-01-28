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


      after(:find_or_create) do |zendark|
        find_or_create(:base_strength, character_id: zendark)
        find_or_create(:base_agility, character_id: zendark)
        
        find_or_create(:bag, character_id: zendark)
        find_or_create(:horsebags, character_id: zendark)

        find_or_create(:career_change, character_id: zendark, from_id: nil, to_id: find_or_create(:diva))
        find_or_create(:career_change, character_id: zendark, from_id: nil, to_id: find_or_create(:farm_bull))
      end
    end
  end
end
