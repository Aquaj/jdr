class Character < ApplicationRecord
  belongs_to :player, optional: true
  has_one    :user, through: :player
end
