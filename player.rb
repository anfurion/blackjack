class Player
  attr_reader :balance, :name, :hand

  def initialize(balance, name)
    @balance = balance
    @name = name
    @hand = []
  end

  def points
    total = 0
    hand
      .sort { |a, b| a.order <=> b.order }
      .each { |card| total += card.value(total) }
    total
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

  def bet(amount)
    @balance -= amount
  end
end
