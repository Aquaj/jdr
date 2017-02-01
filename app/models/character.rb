class Character < ApplicationRecord
  has_stats
  has_inventories
  has_careers

  belongs_to :player, optional: true
  has_one    :user, through: :player

  has_many   :awarenesses

  has_many   :availabilities, as: :to

  with_options through: :availabilities, source: :skill do
    has_many   :talents,   source_type: 'Talent'
    has_many   :abilities, source_type: 'Ability'
  end

  def max_enc
    10 * strength
  end
end
