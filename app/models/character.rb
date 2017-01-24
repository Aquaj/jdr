class Character < ApplicationRecord
  belongs_to :player
  has_one    :user, through: :player
end
