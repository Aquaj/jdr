class Character < ApplicationRecord
  belongs_to :player, optional: true
  has_one    :user, through: :player

  has_many   :base_stats
  has_many   :stats, through: :base_stats

  has_many   :awarenesses

  has_many   :availabilities, as: :to
  has_many   :talents,   through: :availabilities,
                         source: :skill, source_type: 'Talent'
  has_many   :abilities, through: :availabilities,
                         source: :skill, source_type: 'Ability'

  has_many   :inventories, as: :owner
  has_many   :items, through: :inventories

  def hp_stat
    stats.find_by name: :health_points
  end

  def base_stat_of stat
    base_stats.find_by(stat: stat)
             &.value
  end
  alias_method :base_stat_for, :base_stat_of

  def stat_of stat
    base    = base_stats.find_by stat: stat
    changes = base.stat_changes.pluck :amount
    base.value + changes.sum
  end
  alias_method :stat_for, :stat_of

  def hp
    stat_of hp_stat
  end
end
