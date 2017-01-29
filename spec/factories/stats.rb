FactoryGirl.define do
  factory :stat do
    factory :strength do
      name :strength
      nature :primary
    end

    factory :agility do
      name :agility
      nature :primary
    end
  end
end
