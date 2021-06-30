class Card
  ICON_ORDERS = {
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14
  }.freeze

  SUITS = %i[hearts spades clubs diamonds].freeze
  NUMERIC_RANKS = (2..10).freeze
  ICON_RANKS = %i[jack queen king ace].freeze

  attr_reader :suit, :rank, :order

  def initialize(suit, rank) 
    validate!(suit, rank)
    @suit = suit
    @rank = rank
    @order = determine_order(rank)
  end

  def value(points)
    if order == 14
      points < 11 ? 11 : 1
    elsif order > 10
      10
    else
      order
    end
  end

  def face
    "#{suit} #{rank}"
  end

  def determine_order(rank)
    ICON_ORDERS[rank] || rank
  end

  private

  def validate!(suit, rank)
    raise ArgumentError, "#{suit} not included in #{SUITS}" unless suit_valid?(suit)
    raise ArgumentError, "#{rank} not included in #{NUMERIC_RANKS} and #{ICON_RANKS}" unless rank_valid?(rank)
  end

  def suit_valid?(suit)
    SUITS.include?(suit)
  end

  def rank_valid?(rank)
    if rank.is_a? Integer
      NUMERIC_RANKS.include? rank
    else
      ICON_RANKS.include?(rank)
    end
  end
end
