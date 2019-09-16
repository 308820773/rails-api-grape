module V1
  class PostsGrape < SignGrape
    desc '提交排行'
    post '/posts' do
    end

    namespace 'posts' do
      route_params :id do
        desc '排行详情'
        get '/' do
        end

        desc '修改排行'
        put '/' do
        end

        desc '屏蔽'
        delete '/' do
        end

        desc '收藏'
        post '/like' do
        end

        desc '条目列表'
        get '/lines' do
          {a: 1}
        end

        desc '新建条目'
        post '/lines' do
        end
      end
    end
  end
end
