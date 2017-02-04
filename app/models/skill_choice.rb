class SkillChoice < ApplicationRecord
  belongs_to :career

  has_many :availabilities, as: :to
end
