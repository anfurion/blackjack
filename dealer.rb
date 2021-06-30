require_relative 'player'

class Dealer < Player
  def initialize(balance, name = 'Dealer')
    super
  end

  def want_card?
    points < 17
  end

  def step(deck)
    take_card(deck.deal_card) if want_card? && hand.size < 3
  end
end
