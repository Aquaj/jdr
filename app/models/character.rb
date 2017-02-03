class Character < ApplicationRecord
  has_stats
  has_inventories
  has_items
  has_careers

  has_many :career_changes
  has_many :careers_acquired, through: :career_changes, source: :to
  has_many :previous_careers, through: :career_changes, source: :from
  has_many :knowledges_of_classes, class_name: 'Awareness'
  has_many :secret_classes, through: :knowledges_of_classes, source: :fact, source_type: 'Career'

  belongs_to :player, optional: true
  has_one    :user, through: :player

  has_many :base_stats
  has_many :stats, through: :base_stats

  has_many :inventories, as: :owner
  has_many :inventory_changes, through: :inventories

  with_options through: :inventory_changes, source: :item do
    has_many   :things,  source_type: 'Thing'
    has_many   :armours, source_type: 'Armour'
    has_many   :weapons, source_type: 'Weapon'
  end

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
