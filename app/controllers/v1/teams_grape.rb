module V1
  class TeamsGrape < SignGrape
    params do
      requires :team, type: Hash do
        requires :name, type: String
        optional :desc, type: String
      end
    end
    post '/' do
      @team = Team.create!(params.team.to_hash)
      data_record!(@team, Entities::Team::Detail)
    end
  end
end
