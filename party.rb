class Party
  attr_reader :gambler, :dealer, :deck, :winner

  def initialize(dealer, gambler)
    @dealer = dealer
    @gambler = gambler
    @deck = Deck.new.shuffle
  end

  def play!
    deal_cards
    additional_cards
    # finish должен сравнить очки и назначить победителя
  end

  def deal_cards
    2.times do
      gambler.take_card(deck.deal_card)
      dealer.take_card(deck.deal_card)
    end
  end

  def additional_cards
    dealer.take_card(deck.deal_card) if dealer.want_card?
    gambler.take_card(deck.deal_card) if dealer.want_card?
  end
end
