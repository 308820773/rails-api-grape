module V1
  class TeamsGrape < SignGrape
    params do
      requires :team, type: Hash do
        requires :name, type: String
        optional :desc, type: String
      end
    end
    post '/' do
      ActiveRecord::Base.transaction do
        @team  = Team.create!(params.team.to_hash)
        @owner = Members::Owner.create!(user: current_user, team: @team)

        data_record!(@team, Entities::Team::Detail)
      end
    end

    route_param :id, requirements: { id: /[0-9]+/ } do
      params do
        requires :team, type: Hash do
          requires :name, type: String
          optional :desc, type: String
        end
      end
      put '/' do
        current_record.update!(params.team.to_hash)
        data_record!(@team, Entities::Team::Detail)
      end

      delete '/' do
        current_record.destroy
        data!('删除成功')
      end

      post '/join' do
        Member.create!(user: current_user, team: current_record)
        data!('加入成')
      end

      delete '/leave' do
        @member = Member.find_by!(user: current_user, team: current_record)
        @member.destroy

        data!('离开成功')
      end

      params do
        requires :book, type: Hash do
          requires :title, type: String
          optional :desc, type: String
        end
      end
      post '/books' do
        @book = Book.create!(params.book.to_hash.merge(user: current_user, team: current_record))
        data_record!(@book, Entities::Book::Detail)
      end
    end
  end
end
