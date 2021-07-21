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
  end

  def winner
    gambler = @game.gambler
    gambler_points = @game.gambler.points
    dealer = @game.dealer
    dealer_points = @game.dealer.points
    if gambler_points == dealer_points
      puts 'ничья'
      puts 'возвращаем ставку игроку'
      puts 'возвращаем ставку дилеру'
      @game.return_bets
    elsif dealer_points > 21
      puts 'дилер проиграл'
      @game.winner_bet(gambler)
    elsif gambler_points > 21
      puts 'игрок проиграл'
      @game.winner_bet(dealer)
    elsif gambler_points > dealer_points
      puts 'игрок выиграл'
      @game.winner_bet(gambler)
    elsif gambler_points < dealer_points
      puts 'дилер выиграл'
      @game.winner_bet(dealer)
    end
  end

  def show_info
    puts 'Информация'
    puts "Карты игрока: #{@game.gambler.hand.map(&:face)}"
    puts "У вас сейчас #{@game.gambler.points} очков"
    puts "У вас осталось $#{@game.gambler.balance}"
    puts "У дилера осталось $#{@game.dealer.balance}"

    @game.gambler
  end

  def step
    puts '1. Взять карту'
    puts '2. Пропустить ход'
    puts '3. Открыть карты'
    choice = gets.chomp.to_i
    case choice
    when 1
      if @game.gambler.hand.count < 3
        card = @game.gambler.take_card(@game.deck.deal_card)
        puts "Вы взяли еще 1 карту #{card.face}"
        show_info
      else
        puts 'У вас уже есть 3 карты, нельзя брать больше'
      end
      dealer_step
      step
    when 2
      dealer_step
      step
    when 3
      open_cards
    end
  end

  def open_cards
    puts "Карты игрока: #{@game.gambler.hand.map(&:face)}"
    puts "Карты дилера: #{@game.dealer.hand.map(&:face)}"
    winner
    puts "У вас осталось #{@game.gambler.balance}"
    puts "У дилера осталось #{@game.dealer.balance}"
    another_game
  end

  def another_game
    puts 'Сыграть еще раз? (y/n)'
    choice = gets.chomp
    if choice == 'y'
      puts 'Сыграем еще раз!'
      new_game
      step
    else
      puts 'Спасибо за игру!'
    end
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
