class Player
  attr_reader :balance, :name, :hand

  def initialize(balance, name)
    @balance = balance
    @name = name
    @hand = []
  end

  def take_card(card)
    @hand << card
  end

  def drop_cards
    @hand = []
  end

  def won(amount)
    @balance += amount
  end

  def lose(amount)
    @balance -= amount
  end
end
