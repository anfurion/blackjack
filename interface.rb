class Interface
  def initialize
    puts 'Введите имя'
    name = gets.chomp
    @game = Game.new(name)
    new_game
  end

  def new_game
    @game.new_round
    show_info
    step
    finish
  end

  def show_info
    puts 'Информация'
    puts "Карты игрока: #{@game.gambler.hand.map(&:face)}"
    puts "У вас осталось #{@game.gambler.balance}"
    puts "У дилера осталось #{@game.dealer.balance}"
    # 1. Вывод карт игрока. 2. Баланс и имя обоих игроков. 3. Карты дилера не видет игрок.
    # end

    @game.gambler
  end

  def step
    puts '1. Взять карту'
    puts '2. Пропустить ход'
    puts '3. Открыть карты'
    choice = gets.chomp.to_i
    case choice
    when 1
      card = @game.gambler.take_card(@game.deck.deal_card)
      puts "Вы взяли еще 1 карту #{card.face}"
      dealer_step
      step
    when 2
      dealer_step
      step
    when 3
      open_cards
    end
  end

  def another_game
    puts 'Сыграть еще раз? (y/n)'
    choice = gets.chomp
    if choice == 'y'
      new_game
      step
    else
      puts 'Спасибо за игру!'
    end
  end

  def open_cards
    puts "Карты игрока: #{@game.gambler.hand.map(&:face)}"
    puts "Карты дилера: #{@game.dealer.hand.map(&:face)}"
    @game.count_points
    puts "У вас осталось #{@game.gambler.balance}"
    puts "У дилера осталось #{@game.dealer.balance}"
    another_game
  end

  def dealer_step
    cards = @game.dealer.step(@game.deck)
    if cards
      puts 'дилер взял карту'
    else
      puts 'дилер пропустил ход'
    end
  end
end
