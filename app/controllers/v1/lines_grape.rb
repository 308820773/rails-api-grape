module V1
  class LinesGrape < SignGrape
    route_params :id do
      desc '修改条目'
      put '/' do
      end

      desc '删除条目'
      delete '/' do
      end
    end
  end
end
