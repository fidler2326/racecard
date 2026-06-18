# frozen_string_literal: true

class Leg < ActiveRecord::Base
  belongs_to :pool
  belongs_to :card
  belongs_to :race
end
