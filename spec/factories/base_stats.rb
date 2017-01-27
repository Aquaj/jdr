FactoryGirl.define do
  factory :base_stat do
    factory :base_strength do
      association :stat, factory: :strength
      value 65
    end

    factory :base_agility do
      association :stat, factory: :agility
      value 40
    end
  end
end
