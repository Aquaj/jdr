class Campaign < ApplicationRecord
  belongs_to :group
  belongs_to :game_master, class_name: 'User'
end
