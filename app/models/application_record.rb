class ApplicationRecord < ActiveRecord::Base
  include Has::Stats

  self.abstract_class = true
end
