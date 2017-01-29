class Stat < ApplicationRecord
  has_many :base_stats
  has_many :stat_bonuses

  def self.hp_stat
    find_by name: :health_points
  end
end
