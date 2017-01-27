FactoryGirl.define do
  factory :player do
    factory :tonio do
      association :user, factory: :anthony
      association :group, factory: :the_losers
    end
  end
end
