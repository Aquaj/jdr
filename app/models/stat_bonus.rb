class StatBonus < ApplicationRecord
  belongs_to :stat
  belongs_to :career

  has_many :stat_changes, as: :origin
end
