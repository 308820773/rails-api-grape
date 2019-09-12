class Line < ApplicationRecord
  belongs_to :element, counter_cache: true
  belongs_to :post, counter_cache: true

  has_many :marks
end
