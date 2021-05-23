class Player
  attr_reader :balance, :name

  def initialize(balance, name)
    @balance = balance
    @name = name
  end 

  def won(amount)
    @balance += amount
  end

  def lose(amount)
    @balance -= amount
  end
end
