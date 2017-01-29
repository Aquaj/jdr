class Stat < ApplicationRecord
  include StatAliases

  has_many :base_stats
  has_many :stat_bonuses

  define_alias :hp, :health_points

  def self.[] stat_alias
    find_by name: stat_name_for(stat_alias)
  end
end
