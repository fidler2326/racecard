class Pool < ApplicationRecord
  # TODO: add associations that describe a one-to-many association with the legs table. (Done)
  # TODO: add association that describes a many-to-one association with the card table. (Done)
  attr_accessor :suspend, :open, :close

  has_many :legs
  belongs_to :card

  # TODO: add a module that lists the supported Pool statuses

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

  SUPPORTED_CURRENCIES = %w[GBP USD EUR].freeze
  SUPPORTED_STATUSES   = %w[ACTIVE ABANDONED SUSPENDED CLOSED].freeze

  validates :pool_code, presence: true, inclusion: {
    in: BET_TYPES
  }

  validates :currency, presence: true, inclusion: {
    in: SUPPORTED_CURRENCIES
  }

  validates :status, presence: true, inclusion: {
    in: SUPPORTED_STATUSES
  }
end
