class Stat < ApplicationRecord
  has_many :base_stats
  has_many :stat_bonuses

  def self.hp
    find_by name: :health_points
  end

  def self.strength
    find_by name: :strength
  end
end
