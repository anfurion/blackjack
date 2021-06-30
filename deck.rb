require_relative 'card'

class Deck
  attr_reader :cards

  SUITS = %i[hearts spades clubs diamonds].freeze
  RANKS = (2..10).to_a + %i[jack queen king ace]
  # RANKS = %w[Jack Queen King Ace].freeze

  def initialize
    @cards = []
    create_cards
  end

  def deal_card
    @cards.pop
  end

  private

  def create_cards
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end
end
