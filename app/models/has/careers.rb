module Has
  module Careers
    extend ActiveSupport::Concern

    included do
      has_many :career_changes
      has_many :careers_acquired, through: :career_changes, source: :to
      has_many :previous_careers, through: :career_changes, source: :from
      has_many :knowledges_of_classes, class_name: 'Awareness'
      has_many :secret_classes, through: :knowledges_of_classes, source: :fact, source_type: 'Career'
    end

    def careers
      careers_acquired - previous_careers
    end

    def switch_career from: nil, to: nil
      ensure_target_validity!    to
      ensure_career_owned!       from
      ensure_connection_between! from, to

      career_changes.create! from: from, to: to
    end

    def becomes career
      ensure_target_validity! career
      career_changes.create! to: career
    end

    def career_available? career
      career.basic? ||
        careers.any? { |source| source.exits.exists? career.id }
    end

    def career_known? career
      return secret_classes.exists? career.id if career.secret?
      true
    end

    def career_owned? career
      careers_acquired.exists? career.id
    end

    def careers_connected? source, target
      Parentage.find_by source_career: source, leads_to: target
    end

    def ensure_target_validity! career
      ensure_availability! career
      ensure_knowledge_of! career
    end

    def ensure_availability! career
      raise CareerUnavailableException unless career_available? career
    end

    def ensure_knowledge_of! career
      raise CareerUnknownException unless career_known? career
    end

    def ensure_career_owned! career
      raise NotOwnedCareerException unless career_owned? career
    end

    def ensure_connection_between! source, target
      raise NoCareerPathException unless careers_connected? source, target
    end
  end
end

class CareerUnavailableException < Exception; end;
class CareerUnknownException < Exception; end;
class NotOwnedCareerException < Exception; end;
class NoCareerPathException < Exception; end;
