class BaseStat < ApplicationRecord
  belongs_to :stat
  belongs_to :character

  has_many :stat_changes
end
