class CareerChange < ApplicationRecord
  belongs_to :character
  belongs_to :from, class_name: 'Career'
  belongs_to :to,   class_name: 'Career'
end
