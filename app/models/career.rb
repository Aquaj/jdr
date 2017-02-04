class Career < ApplicationRecord
  has_many :stat_bonuses
  has_many :skill_choices

  has_many :optional_skill_availabilities, through: :skill_choices, source: :availabilities

  with_options through: :optional_skill_availabilities, source: :skill do
    has_many :optional_talents,   source_type: 'Talent'
    has_many :optional_abilities, source_type: 'Ability'
  end

  has_many :skill_availabilities, class_name: 'Availability', as: :to

  with_options through: :skill_availabilities, source: :skill do
    has_many :mandatory_talents,   source_type: 'Talent'
    has_many :mandatory_abilities, source_type: 'Ability'
  end

  with_options class_name: 'Parentage' do
    has_many :ascendant_parentages,  foreign_key: :leads_to_id
    has_many :descendant_parentages, foreign_key: :source_career_id
  end

  has_many :entries,  through: :ascendant_parentages,  source: :source_career, class_name: 'Career'
  has_many :exits,    through: :descendant_parentages, source: :leads_to,      class_name: 'Career'

  has_many :awarenesses, as: :fact

  def talents
    optional_talents + mandatory_talents
  end

  def abilities
    optional_abilities + mandatory_abilities
  end

  def skills
    talents + abilities
  end

  def secret?
    secret
  end

  def advanced?
    nature == 'advanced'
  end

  def basic?
    nature == 'basic'
  end
end
