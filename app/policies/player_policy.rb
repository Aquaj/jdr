class PlayerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
