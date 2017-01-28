class Stat < ApplicationRecord
  has_many :base_stats
  has_many :stat_bonuses
end
