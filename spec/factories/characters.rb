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

    notable_details     "Scar"
    siblings    "3"
    birth_place "The Void"
  end
end
