FactoryGirl.define do
  factory :player, aliases: [:tonio] do
    association :user, factory: :anthony
    association :group, factory: :the_losers
  end
end
