FactoryGirl.define do
  factory :character, aliases: [:zendark] do
    association :player, factory: :tonio

    name        "Zendark"
    race        "Gay"
    sign        "Zodiac"
    gender      "None"
    weight      90
    height      185
    eye_color   "Deep"
    hair_color  "Polychromatic"

    siblings        "3 - 1 brother, 2 sisters"
    birth_place     "The Void"
    notable_details "Scar"


    after(:create) do |zendark|
      create(:base_strength, character: zendark)
      create(:base_agility, character: zendark)
    end
  end
end
