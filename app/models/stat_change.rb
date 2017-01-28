class StatChange < ApplicationRecord
  belongs_to :base_stat
  belongs_to :origin, polymorphic: true
end
