class Character < ApplicationRecord
  has_stats

  belongs_to :player, optional: true
  has_one    :user, through: :player

  has_many   :awarenesses

  has_many   :availabilities, as: :to
  has_many   :talents,   through: :availabilities,
                         source: :skill, source_type: 'Talent'
  has_many   :abilities, through: :availabilities,
                         source: :skill, source_type: 'Ability'

  def max_enc
    10 * strength
  end
end
