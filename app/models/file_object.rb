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

class FileObject < ApplicationRecord
  include Disable

  belongs_to :fileable, polymorphic: true
  belongs_to :user, optional: true

  mount_uploader :file, FileUploader

  before_create do
    if file.try(:file)
      o_file             = file.file
      original_name, ext = o_file.filename.split(/\./)

      self.filename       = original_name
      self.ext            = ext
      self.size           = o_file.size
      self.content_digest = Digest::SHA1.hexdigest(o_file.read)
    end
  end

  def filename_with_ext
    file.try(:identifier)
  end
end
