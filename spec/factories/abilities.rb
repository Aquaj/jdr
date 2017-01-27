FactoryGirl.define do
  factory :dancing, class: :ability do
    name 'Dancing'
  end

  factory :punching, class: :ability do
    name 'Punching'
  end

  factory :sassy_snap, class: :ability do
    name 'Sassy Snap'
  end

  factory :snap_of_death, class: :ability do
    name 'Snap of Death'
  end

  factory :secret_ability, class: :ability do
    name 'Secret'
  end
end
