class User < ApplicationRecord
  acts_as_tagger
  rolify

  has_one :files_avatar, :class_name => 'Files::Avatar', as: :fileable
  has_many :user_accounts

  action_store :favorite, :post, counter_cache: true, user_counter_cache: true # 收藏
  action_store :like, :post, counter_cache: true, user_counter_cache: true # 点赞
  action_store :unlike, :post, counter_cache: true, user_counter_cache: true # 点踩

  # mark
  action_store :like, :line, counter_cache: true, user_counter_cache: true # 点赞
  action_store :unlike, :line, counter_cache: true, user_counter_cache: true # 点踩

  def self.build_with!(payload = {})
    payload = Hashie::Mash.new(payload) rescue Hashie::Mash.new
    raise SignError, '登录失败, 请重试' if payload.id.blank?

    find(payload.id)
  end

  def payload
    slice(:id, :avatar_url, :name)
  end

  def name
    nickname || user_accounts.map(&:nickname).compact.first
  end

  def avatar_url
    files_avatar.try(:file_url) || user_accounts.map(&:avatar_url).compact.first
  end

  def gen_code
    return code if code.present? && Time.current - updated_at < 60

    update!(code: rand(999_999))
    code
  end
end
