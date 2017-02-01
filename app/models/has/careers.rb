module Has
  module Careers
    extend ActiveSupport::Concern

    included do
      has_many :career_changes
      has_many :careers_acquired, through: :career_changes, source: :to
      has_many :previous_careers, through: :career_changes, source: :from
    end

    def careers
      careers_acquired - previous_careers
    end
  end
end
