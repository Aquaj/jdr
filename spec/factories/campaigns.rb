FactoryGirl.define do
  factory :ultimate, class: :campaign do
    name 'Ultimate Campaigning'
    association :game_master, factory: :jeremie
    association :group, factory: :the_losers
  end
end
