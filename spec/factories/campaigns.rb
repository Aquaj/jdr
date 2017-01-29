FactoryGirl.define do
  factory :campaign do
    factory :ultimate do
      name 'Ultimate Campaigning'
      group       factory: :the_losers, strategy: :find_or_create
      game_master factory: :jeremie,    strategy: :find_or_create
    end
  end
end
