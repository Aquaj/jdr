FactoryGirl.define do
  factory :career do
    factory :farm_bull do
      name 'Farm Bull'
    end

    factory :diva do
      name 'Diva'
    end

    factory :icon do
      name 'Icon'

      after do |icon|
        create(:parentage, source_career_id: create(:diva), leads_to_id: icon)
      end
    end

    factory :secret_career do
      name   'Secret'
      nature :hidden

      after do |secret|
        create(:parentage, source_career_id: create(:diva), leads_to_id: secret)
      end
    end

    factory :death_itself do
      name 'Death Itself'
    end

    factory :proplayer do
      name 'Proplayer'
    end
  end
end
