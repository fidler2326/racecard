class Card < ApplicationRecord
  has_many :races
  has_many :runners
  has_many :pools
  has_many :legs

  validates :name, presence: true, length: { maximum: 255 }
  validate :race_date_cannot_be_in_the_past

  private

  def race_date_cannot_be_in_the_past
    if race_date.present? && race_date < Date.today
      errors.add(:race_date, "can't be in the past")
    end
  end
end

