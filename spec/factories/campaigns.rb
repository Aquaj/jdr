FactoryGirl.define do
  factory :campaign do
    factory :ultimate do
      name 'Ultimate Campaigning'
      association :game_master, factory: :jeremie
      association :group, factory: :the_losers
    end
  end
end
