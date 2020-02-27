class TeamBook < ApplicationRecord
  belongs_to :team
  belongs_to :book

  validates :book_id, uniqueness: { scope: :team_id }
end
