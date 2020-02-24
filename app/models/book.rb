class Book < ApplicationRecord
  has_many :cards

  belongs_to :user
  belongs_to :team

  validates :title, uniqueness: { scope: :team_id }
end
