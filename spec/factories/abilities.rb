FactoryGirl.define do
  factory :ability do
    factory :dancing do
      name 'Dancing'
    end

    factory :punching do
      name 'Punching'
    end

    factory :sassy_snap do
      name 'Sassy Snap'
    end

    factory :snap_of_death do
      name 'Snap of Death'
    end

    factory :secret_ability do
      name   'Secret'
      secret true
    end
  end
end
