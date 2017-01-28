class Availability < ApplicationRecord
  belongs_to :to,    polymorphic: true
  belongs_to :skill, polymorphic: true
end
