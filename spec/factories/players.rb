FactoryGirl.define do
  factory :player do
    factory :tonio do
      user  factory: :anthony,    strategy: :find_or_create
      group factory: :the_losers, strategy: :find_or_create
    end
  end
end
