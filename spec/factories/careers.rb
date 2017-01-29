FactoryGirl.define do
  factory :career do
    factory :farm_bull do
      name 'Farm Bull'

      after :create do |bull|
        link_talent  :strong_af, to: bull
        link_ability :punching, to: bull

        stat_bonus 20, :strength, bull
      end
    end

    factory :actual_tractor do
      name 'Actual Tractor'

      after :create do |tractor|
        link_career :farm_bull, to: tractor
        stat_bonus 30, :strength, bull
      end
    end

    factory :diva do
      name 'Diva'

      after :create do |diva|
        link_talent  :gay, to: diva
        link_ability :dancing, to: diva
        link_ability :sassy_snap, to: diva

        stat_bonus 15, :agility, diva
      end
    end

    factory :icon do
      name 'Icon'

      after :create do |icon|
        link_career :diva, to: icon
      end
    end

    factory :secret_career do
      name   'Secret'
      nature :hidden

      after :create do |secret|
        link_career :diva, to: secret

        link_talent  :secret_talent, to: secret
        link_ability :secret_ability, to: secret
      end
    end

    factory :death_itself do
      name 'Death Itself'

      after :create do |death|
        link_talent  :lethal, to: death
        link_ability :snap_of_death, to: death
      end
    end

    factory :proplayer do
      name 'Proplayer'
    end
  end
end

def link_skill(skill, to: nil)
  find_or_create(:availability,
                 skill: find_or_create(skill),
                 to: to)
end
alias link_talent  link_skill
alias link_ability link_skill

def stat_bonus(bonus, stat, career)
  find_or_create(:stat_bonus,
                 career: career,
                 amount: bonus,
                 stat: find_or_create(stat))
end

def link_career(source, to: nil)
  find_or_create(:parentage,
                 source_career: find_or_create(source),
                 leads_to: to)
end
