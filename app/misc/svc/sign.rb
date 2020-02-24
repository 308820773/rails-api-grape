module Svc
  class Sign < Base
    def initialize
    end

    def call
    end

    def self.wechat(openid, params)
      account = Accounts::Wechat.find_by(openid: openid)
      return Svc::Signup.wechat(openid, params) if account.nil?

      account.update!(params)
      account
    end
  end
end
