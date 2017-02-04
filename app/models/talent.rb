class Talent < ApplicationRecord
  has_many :stat_changes, as: :origin
  has_many :availabilities, as: :skill

  def secret?
    false
  end
end
