module V1
  class WxaGrape < PubGrape
    params do
      requires :js_code, type: String, desc: '小程序临时登录凭证 code'

      optional :user_account, type: Hash do
        optional :nickname, type: String
        optional :avatar_url, type: String
        optional :user_info, type: String
      end
    end
    get '/login' do
      client = Clients::WxaSign.execute(nil, js_code: params.js_code)

      if client.response_valid?
        account = Svc::Sign.wechat(client.response_data.openid, params.user_account.to_hash)
        data!(token: Svc::JwtSignature.sign(account.user.payload))
      else
        data!(client.response_data)
      end
    end
  end
end
