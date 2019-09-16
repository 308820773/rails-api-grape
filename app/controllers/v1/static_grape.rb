module V1
  class StaticGrape < PubGrape
    get '/about' do
      'pub page'
    end

    desc '推荐'
    get '/dashboard' do
    end
  end
end
