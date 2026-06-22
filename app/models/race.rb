class Race < ApplicationRecord
  # TODO: add relationship to the Card model that describes a one-to-many association, i.e. a card can have many races
  # TODO: validate the presence of :name, :time, :number
  # TODO add validation for uniqueness of race number and card_id combination
  # TODO: validate a sensible minimum character requirement for the name attribute
  # TODO: validate a maximum character requirement for the name attribute, matching the varchar(255) limit in the database
end
