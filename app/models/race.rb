class Race < ApplicationRecord
  belongs_to :card
  has_many :runners
  validates :name, :time, :number, presence: true
  validates :number, numericality: { only_integer: true, allow_nil: false, greater_than: 0 }
end
