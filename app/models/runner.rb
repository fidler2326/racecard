# frozen_string_literal: true
class Runner < ApplicationRecord
  belongs_to :card
  belongs_to :race

  validates :name, presence: true
  validates :number, numericality: { only_integer: true, allow_nil: false, greater_than: 0 }
  validates :number, uniqueness: { scope: :race }
  validates :program_number, uniqueness: { scope: :race }
end