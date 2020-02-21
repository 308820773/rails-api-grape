# base for sign grapes
class WxaGrape < BaseGrape
  params do
    requires :js_code, type: String, desc: '小程序临时登录凭证 code'
  end
  get '/login' do
    client = Clients::WxaSign.execute(nil, js_code: params.js_code)

    if client.response_valid?
      openid = client.response_data.openid
    else
      client.response_data
    end
  end
end
