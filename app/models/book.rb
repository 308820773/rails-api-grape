class Book < ApplicationRecord
  acts_as_taggable_on

  has_many :cards
  has_many :team_books

  belongs_to :user

  validates :title, uniqueness: { scope: :team_id }
end
