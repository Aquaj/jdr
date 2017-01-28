class Career < ApplicationRecord
  has_many :stat_bonuses
  has_many :skill_choices

  has_many :ascendant_parentages,  class_name: 'Parentage', foreign_key: :leads_to
  has_many :descendant_parentages, class_name: 'Parentage', foreign_key: :source_career

  has_many :ascendants,  through: :ascendant_parentages,  class_name: 'Career'
  has_many :descendants, through: :descendant_parentages, class_name: 'Career'

  has_many :awarenesses, as: :fact
end
