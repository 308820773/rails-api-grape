module Svc
  class Signup < Base
    def initialize
    end

    def call
    end

    def self.wechat(openid, params)
      ActiveRecord::Base.transaction do
        Accounts::Wechat.create!({ openid: openid, user: User.create! }.merge(params))
      end
    end
  end
end
