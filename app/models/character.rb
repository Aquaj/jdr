class Character < ApplicationRecord
  belongs_to :player, optional: true
  has_one    :user, through: :player

  has_many   :base_stats
  has_many   :awarenesses
  has_many   :availabilities, as: :owner
  has_many   :inventories, as: :owner
  has_many   :items, through: :inventories
end
