FactoryGirl.define do
  factory :farm_bull, class: :career do
    name 'Farm Bull'
  end

  factory :diva, class: :career do
    name 'Diva'
  end

  factory :icon, class: :career do
    name 'Icon'

    after do |icon|
      create(:parentage, source_career_id: create(:diva), leads_to_id: icon)
    end
  end

  factory :secret_career, class: :career do
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
