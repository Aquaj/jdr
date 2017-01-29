class Character < ApplicationRecord
  has_stats

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

  def hp
    stat_of Stat[:HP]
  end

  def max_enc
    10 * stat_of(Stat[:Strength])
  end
end
