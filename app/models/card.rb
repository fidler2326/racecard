class Card < ApplicationRecord
  has_many :races
  has_many :runners
  has_many :pools
  has_many :legs
end
