class Pool < ApplicationRecord
  has_many :legs
  belongs_to :card

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
end
