class Card < ApplicationRecord
  belongs_to :user
  belongs_to :book, optional: true
end
