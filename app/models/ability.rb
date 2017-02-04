class Ability < ApplicationRecord
  has_many :awarenesses, as: :fact
  has_many :availabilities, as: :skill

  def secret?
    secret
  end
end
