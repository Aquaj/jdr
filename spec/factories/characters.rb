FactoryGirl.define do
  factory :character do
    factory :zendark do
      player factory: :tonio, strategy: :find_or_create

      name        'Zendark'
      race        'Gay'
      sign        'Zodiac'
      gender      'None'
      weight      90
      height      185
      eye_color   'Deep'
      hair_color  'Polychromatic'

      siblings        '3 - 1 brother, 2 sisters'
      birth_place     'The Void'
      notable_details 'Scar'


      after :create do |zendark|
        strength = give_base :strength, 65,  to: zendark
        agility  = give_base :agility,  35,  to: zendark
        hp       = give_base :hp,       10,  to: zendark

        add_inventory :bag,       to: zendark
        add_inventory :horsebags, to: zendark

        give_career   :farm_bull, to: zendark
        give_career   :diva,      to: zendark

        give_bonus  15, on: strength, from: :farm_bull
        give_bonus  15, on: agility,  from: :diva

        give_talent   :gay,       to: zendark
        give_talent   :strong_af, to: zendark

        add_points  5, on: strength, because_of: :strong_af
        add_points  2, on: hp,       because_of: :strong_af

        give_ability  :dancing,   to: zendark
        give_ability  :punching,  to: zendark
      end
    end
  end
end

def give_base(stat, value, to: nil)
  find_or_create(:base_stat,
                 stat: find_or_create(stat),
                 value: value,
                 character: to)
end

def give_career(career, to: nil)
  find_or_create(:career_change,
                 character: to,
                 from: nil,
                 to: find_or_create(career))
end

def give_skill(skill, to: nil)
  find_or_create(:availability,
                 skill: find_or_create(skill),
                 to: to)
end
alias give_ability give_skill
alias give_talent  give_skill

def add_inventory(inventory, to: nil)
  find_or_create(inventory, owner: to)
end

def give_bonus(amount, on: nil, from: nil)
  career = find_or_create(from)
  stat_bonus = StatBonus.find_by(career: career, stat: on.stat)

  add_points(amount, on: on, because_of: stat_bonus)
end

def add_points(amount, on: nil, because_of: nil)
  because_of = find_or_create(because_of) unless because_of.class.respond_to? :primary_key
  find_or_create(:stat_change,
                 base_stat: on,
                 amount: amount,
                 origin: because_of)
end
