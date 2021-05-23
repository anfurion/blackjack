require_relative 'card'

class Deck
  attr_reader :cards

  SUITS = %w[Hearts Spades Clubs Diamonds].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
  # RANKS = %w[Jack Queen King Ace].freeze

  def initialize
    @cards = []
    create_cards
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_card
    @cards.pop
  end

  private

  def create_cards
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards.push(Card.new(suit, rank))
      end
    end
  end
end
