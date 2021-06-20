class Interface
  def initialize
    puts 'Введите имя'
    name = gets.chomp
    @game = Game.new(name)
    new_game
  end

  def new_game
    @game.new_round
  end

  def show_info
    # 1. Вывод карт игрока. 2. Баланс и имя обоих игроков. 3. Карты дилера не видет игрок.
    # end

    @game.gambler
  end
end
