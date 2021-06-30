class Game
  attr_reader :gambler, :dealer, :deck, :bet_amount, :bank

  def initialize(gambler_name)
    @gambler = Gambler.new(100, gambler_name)
    @dealer = Dealer.new(100)
    @bank = 0
    @bet_amount = 10
  end

  def new_round
    place_bets
    @deck = Deck.new
    deal_cards
  end

  def play!
    deal_cards
    additional_cards
  end

  def deal_cards
    2.times do
      gambler.take_card(deck.deal_card)
      dealer.take_card(deck.deal_card)
    end
  end

  def additional_cards
    dealer.take_card(deck.deal_card) if dealer.want_card?
    gambler.take_card(deck.deal_card) if gambler.want_card?
  end
end

  private

  def place_bets
    gambler.bet(bet_amount)
    @bank += bet_amount
    dealer.bet(bet_amount)
    @bank += bet_amount
  end
