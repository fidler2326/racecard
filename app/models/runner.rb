# frozen_string_literal: true
class Runner < ApplicationRecord
  # TODO: add associations that describe a one-to-one association with both the races and cards tables. (done)
  # TODO: add validations that ensure that the name and number are present. (true)
  # TODO: add validations that ensure that the number and program_number are unique within the scope of a race. (done)
  has_one :race
  has_one :card
  belongs_to :card
  belongs_to :race

  validates :name, :number, presence: true
  validates :number, :program_number, uniqueness: true
end