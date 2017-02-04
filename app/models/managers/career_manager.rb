require File.join Rails.root, 'app', 'models', 'career', 'exceptions'

module Managers
  class CareerManager < Manager
    needs_from_owner :career_changes
    needs_from_owner :careers_acquired
    needs_from_owner :previous_careers
    needs_from_owner :secret_classes

    def careers
      careers_acquired - previous_careers
    end

    def switch_career from: nil, to: nil
      ensure_target_validity!    to
      if from
        ensure_owned!       from
        ensure_connection_between! from, to
      end

      career_changes.create! from: from, to: to
    end

    def becomes career
      switch_career to: career
    end

    protected

    def available? career
      career.basic? ||
        careers.any? { |source| source.exits.exists? career.id }
    end

    def known? career
      return secret_classes.exists? career.id if career.secret?
      true
    end

    def owned? career
      careers_acquired.exists? career.id
    end

    def connected? source, target
      Parentage.find_by source_career: source, leads_to: target
    end

    # FIXME: There _must_ be a pattern to refactor these...

    def ensure_target_validity! career
      ensure_availability! career
      ensure_knowledge_of! career
    end

    def ensure_availability! career
      raise CareerUnavailableException unless available? career
    end

    def ensure_knowledge_of! career
      raise CareerUnknownException unless known? career
    end

    def ensure_owned! career
      raise NotOwnedCareerException unless owned? career
    end

    def ensure_connection_between! source, target
      raise NoCareerPathException unless connected? source, target
    end
  end
end
