require File.join Rails.root, 'app', 'models', 'ability', 'exceptions'
require File.join Rails.root, 'app', 'models', 'talent',  'exceptions'

module Managers
  class SkillManager < Manager
    needs_from_owner :careers_acquired
    needs_from_owner :availabilities
    needs_from_owner :talents
    needs_from_owner :abilities
    needs_from_owner :secret_abilities

    def gets_skill skill
      raise skill_unavailable skill unless available? skill
      availabilities.create! skill: skill
    end
    alias gets_talent gets_skill

    def gets_ability ability
      raise AbilityUnknownException unless known? ability
      gets_skill ability
    end

    protected

    def known? skill
      return secret_abilities.include? skill if (Ability === skill) && skill.secret?
      true
    end

    def available? skill
      careers_acquired.any? { |career| career.skills.include? skill }
    end

    def skill_unknown skill
      return TalentUnknownException if Talent === skill
      AbilityUnknownException
    end

    def skill_unavailable skill
      return TalentUnavailableException if Talent === skill
      AbilityUnavailableException
    end
  end
end
