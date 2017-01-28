class Awareness < ApplicationRecord
  belongs_to :character
  belongs_to :fact, polymorphic: true
end
