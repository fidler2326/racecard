class Race < ApplicationRecord
  belongs_to :card
  has_many :runners
end
