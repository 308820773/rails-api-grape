class User < ApplicationRecord
  rolify

  has_one :files_avatar, :class_name => 'Files::Avatar', as: :fileable

  action_store :favorite, :post, counter_cache: true, user_counter_cache: true # 收藏
  action_store :like, :post, counter_cache: true, user_counter_cache: true # 点赞
  action_store :unlike, :post, counter_cache: true, user_counter_cache: true # 点踩

  # mark
  action_store :like, :line, counter_cache: true, user_counter_cache: true # 点赞
  action_store :unlike, :line, counter_cache: true, user_counter_cache: true # 点踩

  def payload
    slice(:id)
  end

  def gen_code
    return code if code.present? && Time.current - updated_at < 60

    update!(code: rand(999_999))
    code
  end
end
