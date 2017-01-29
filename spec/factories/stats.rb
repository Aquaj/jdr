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

    factory :hp do
      name :health_points
      nature :secondary
    end
  end
end
