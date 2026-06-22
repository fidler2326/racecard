class Pool < ApplicationRecord
  has_many :legs
  belongs_to :card

  attr_accessor :suspend, :open, :close

  module BetType
    WIN = "WIN".freeze
    PLACE = "PLC".freeze
    EACH_WAY = "E/W".freeze
    EXACTA = "EXA".freeze
    TRIFECTA = "TRI".freeze
    SUPERFECTA = "SFC".freeze
    PICK4 = "PK4".freeze
    PICK6 = "PK6".freeze
    QUADPOT = "QPT".freeze
  end

  BET_TYPES = BetType.constants.collect { |c| BetType.const_get c }

  def can_delete?
    total.zero? && (status.to_s.upcase == "ABANDONED" || status.to_s.upcase == "SUSPENDED")
  end
end
