module Clients
  class WxaSign < BaseClient
    def set_request
      {
        http_method:  'get',
        url:          'https://api.weixin.qq.com/sns/jscode2session',
        query_params: {
          appid:      ENV['WXA_APP_ID'],
          secret:     ENV['WXA_APP_SECRET'],
          js_code:    other_params.js_code,
          grant_type: 'authorization_code',
        }
      }
    end

    def response_valid?
      response.errcode == 0
    end

    def build_response_data
      if response_valid?
        response
      else
        response.errmsg
      end
    end
  end
end
