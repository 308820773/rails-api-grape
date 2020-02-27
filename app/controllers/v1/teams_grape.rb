module V1
  class TeamsGrape < SignGrape
    desc '创建班级' do
      headers Authorization: {
        description: 'jwt token',
        required:    true
      }
      summary '创建班级'
      success Entities::Team::Detail
      detail 'post_teams?'
      tags ['teams']
    end
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
      desc '修改班级' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '修改班级'
        success Entities::Team::Detail
        detail 'put_teams_id?'
        tags ['teams']
      end
      params do
        requires :team, type: Hash do
          requires :name, type: String
          optional :desc, type: String
        end
      end
      put '/' do
        current_record.update!(params.team.to_hash)
        data_record!(current_record, Entities::Team::Detail)
      end

      desc '删除班级' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '删除班级'
        success Entities::Team::Detail
        detail 'delete_teams_id?'
        tags ['teams']
      end
      delete '/' do
        current_record.destroy
        data!('删除成功')
      end

      desc '加入班级' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '加入班级'
        success Entities::Team::Detail
        detail 'post_teams_id_join?'
        tags ['teams']
      end
      post '/join' do
        current_record.members.create!(user: current_user)
        data!('加入成功')
      end

      desc '离开班级' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '离开班级'
        success Entities::Team::Detail
        detail 'post_teams_id_join?'
        tags ['teams']
      end
      delete '/leave' do
        @member = current_record.members.find_by!(user: current_user)
        @member.destroy

        data!('离开成功')
      end

      desc '踢人' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '踢人'
        success Entities::Team::Detail
        detail 'post_teams_id_join?'
        tags ['teams']
      end
      params do
        requires :member_id, type: Integer
      end
      delete '/kick' do
        @member = current_record.members.find(params.member_id)
        @member.destroy

        data!('删除成功')
      end

      desc '添加学习集' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '添加学习集'
        success Entities::Team::Detail
        detail 'post_teams_id_books?'
        tags ['teams']
      end
      params do
        requires :book_id, type: Integer
      end
      post '/books' do
        @book = Book.find(params.book_id)
        current_record.team_books.create!(book: @book)
        data!('添加成功')
      end

      desc '删除学习集' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '删除学习集'
        success Entities::Team::Detail
        detail 'delete_teams_id_books?'
        tags ['teams']
      end
      delete '/books' do
        @book = Book.find(params.book_id)
        @team_book = current_record.team_books.find_by!(book: @book)
        @team_book.destroy
        data!('删除成功')
      end
    end
  end
end
