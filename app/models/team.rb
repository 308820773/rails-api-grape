class Team < ApplicationRecord
  has_many :team_books
  has_many :members
end
