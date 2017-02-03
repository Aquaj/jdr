class Career < ApplicationRecord
  has_many :stat_bonuses
  has_many :skill_choices

  has_many :ascendant_parentages,  class_name: 'Parentage', foreign_key: :leads_to_id
  has_many :descendant_parentages, class_name: 'Parentage', foreign_key: :source_career_id

  has_many :entries,  through: :ascendant_parentages,  source: :source_career, class_name: 'Career'
  has_many :exits,    through: :descendant_parentages, source: :leads_to ,class_name: 'Career'

  has_many :awarenesses, as: :fact

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
