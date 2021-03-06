class Stat < ApplicationRecord
  include StatAliases

  has_many :base_stats
  has_many :stat_bonuses

  define_alias :hp, :health_points

  def self.[] stat_alias
    return nil if stat_alias.nil?
    stat_alias = stat_alias.to_sym
    stat   = find_by name: stat_alias
    stat ||= find_by name: stat_name_for(stat_alias)
    stat
  end
end
