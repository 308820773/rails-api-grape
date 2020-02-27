module V1
  class BooksGrape < SignGrape
    desc '创建学习集' do
      headers Authorization: {
        description: 'jwt token',
        required:    true
      }
      summary '创建学习集'
      success Entities::Book::Detail
      detail 'post_books?'
      tags ['books']
    end
    params do
      requires :book, type: Hash do
        requires :title, type: String
        optional :desc, type: String
        optional :team_id, type: Integer
      end
    end
    post '/' do
      ActiveRecord::Base.transaction do
        @book  = Book.create!({ user: current_user }.merge(params.book.to_hash))

        data_record!(@book, Entities::Book::Detail)
      end
    end

    route_param :id, requirements: { id: /[0-9]+/ } do
      desc '修改学习集' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '修改学习集'
        success Entities::Book::Detail
        detail 'put_books_id?'
        tags ['teams']
      end
      params do
        requires :book, type: Hash do
          requires :title, type: String
          optional :desc, type: String
        end
      end
      put '/' do
        current_record.update!(params.book.to_hash)
        data_record!(current_record, Entities::Book::Detail)
      end

      desc '删除学习集' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '删除学习集'
        success Entities::Book::Detail
        detail 'delete_teams_id?'
        tags ['teams']
      end
      delete '/' do
        current_record.destroy
        data!('删除成功')
      end

      #添加标签
      #删除标签
      desc '购买学习集' do
        headers Authorization: {
          description: 'jwt token',
          required:    true
        }
        summary '加入班级'
        success Entities::Team::Detail
        detail 'post_teams_id_join?'
        tags ['teams']
      end
      post '/buy' do
        current_record.members.create!(user: current_user)
        data!('加入成功')
      end
    end
  end
end
