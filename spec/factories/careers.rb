FactoryGirl.define do
  factory :farm_bull, class: :career do
    name 'Farm Bull'
  end

  factory :diva, class: :career do
    name 'Diva'
  end

  factory :icon, class: :career do
    name 'Icon'
  end

  factory :secret, class: :career do
    name   'Secret'
    nature :hidden
  end

  factory :death_itself, class: :career do
    name 'Death Itself'
  end

  factory :proplayer, class: :career do
    name 'Proplayer'
  end
end
