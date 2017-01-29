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
end
