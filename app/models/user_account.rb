class UserAccount < ApplicationRecord
  belongs_to :user

  serialize :info, JSON
end
