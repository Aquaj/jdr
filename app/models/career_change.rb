class CareerChange < ApplicationRecord
  belongs_to :from
  belongs_to :to
  belongs_to :character
end
