module V1
  class TeamsPolicy < ApplicationPolicy
    def post_teams?
      true
    end

    def put_teams_id?
      true
    end

    def get_teams_id?
      true
    end

    def delete_teams_id?
      true
    end

    def post_teams_id_join?
      true
    end

    def delete_teams_id_leave?
      true
    end

    def delete_teams_id_kick?
      true
    end

    def post_teams_id_books?
      true
    end

    def delete_teams_id_books?
      true
    end
  end
end
