class Race < ApplicationRecord
  # TODO: add relationship to the Card model that describes a one-to-many association, i.e. a card can have many races (Done)
  # TODO: validate the presence of :name, :time, :number (Done)
  # TODO add validation for uniqueness of race number and card_id combination (Done)
  # TODO: validate a sensible minimum character requirement for the name attribute (Done)
  # TODO: validate a maximum character requirement for the name attribute, matching the varchar(255) limit in the database (Done)

  validates :name, :time, :number, presence: true
  validates :number, numericality: { greater_than_or_equal_to: 1 }
  validates :name, uniqueness: true
  validates :name, length: { maximum: 255}
  belongs_to :card
  has_many :runners, dependent: :destroy



end
