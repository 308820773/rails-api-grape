module V1
  class WxaGrape < PubGrape
    params do
      requires :js_code, type: String, desc: '小程序临时登录凭证 code'

      opontial :user_info, type: Hash do
        opontial :nick_name, type: String
        opontial :avatar_url, type: String
        opontial :gender, type: String
        opontial :province, type: String
        opontial :city, type: String
        opontial :country, type: String
      end
    end
    get '/login' do
      client = Clients::WxaSign.execute(nil, js_code: params.js_code)

      if client.response_valid?
        data!(client.response_data.openid)
      else
        data!(client.response_data)
      end
    end
  end
end
