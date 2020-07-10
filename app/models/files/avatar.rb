# == Schema Information
#
# Table name: file_objects
#
#  id                :bigint           not null, primary key
#  content_digest    :string(255)
#  disabled_at       :datetime
#  ext               :string(255)
#  file              :string(255)
#  fileable_type     :string(255)
#  filename          :string(255)
#  original_filename :string(255)
#  size              :decimal(10, )
#  type              :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  created_user_id   :bigint
#  fileable_id       :string(255)
#  updated_user_id   :bigint
#  user_id           :integer
#

module Files
  class Avatar < ImageObject
  end
end
