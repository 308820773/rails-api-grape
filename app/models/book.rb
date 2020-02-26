class Book < ApplicationRecord
  has_many :cards
  has_many :team_books

  belongs_to :user

  validates :title, uniqueness: { scope: :team_id }
end
