module V1
  class TeamsPolicy < ApplicationPolicy
    def post_teams?
      true
    end
  end
end
