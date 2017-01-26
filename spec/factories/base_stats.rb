FactoryGirl.define do
  factory :base_strength, class: :base_stat do
    association :stat, factory: :strength
    value 65
  end

  factory :base_agility, class: :base_stat do
    association :stat, factory: :agility
    value 40
  end
end
