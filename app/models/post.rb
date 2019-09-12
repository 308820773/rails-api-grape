class Post < ApplicationRecord
  include Disable

  acts_as_taggable
  resourcify

  scope :default_list, -> { enabled.order(id: :desc) }

  has_many :lines
end
