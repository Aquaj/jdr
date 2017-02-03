class ApplicationRecord < ActiveRecord::Base
  include WithManagers

  self.abstract_class = true
end
