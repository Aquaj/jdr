FactoryGirl.define do
  factory :base_stat do
    factory :base_strength do
      stat factory: :strength
      value 65
    end

    factory :base_agility do
      stat factory: :agility
      value 40
    end
  end
end
