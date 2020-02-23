class PubGrape < BaseGrape
  # mounts
  mount V1::StaticGrape => '/v1'
  mount V1::WxaGrape => '/v1/wxa'
end
