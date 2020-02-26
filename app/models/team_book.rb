class TeamBook < ApplicationRecord
  belongs_to :team
  belongs_to :book
end
