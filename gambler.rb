require_relative 'player'

class Gambler < Player
  def want_card?
    puts "у вас #{points}. взять еще карту 1 / 0?"
    gets.chomp.to_i == 1
  end
end
