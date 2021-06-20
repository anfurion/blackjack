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
    party = Party.new(dealer, gambler)
    party.play!
    party.winner.won(bank)
    @bank = 0
  end

  private

  def place_bets
    gambler.bet(bet_amount)
    @bank += bet_amount
    dealer.bet(bet_amount)
    @bank += bet_amount
  end
end
