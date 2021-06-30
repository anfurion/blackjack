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
    show_info
  end

  def show_info
    puts 'Информация'
    puts "Карты игрока: #{@game.gambler.hand.map(&:face)}"
    puts "Взять карту: #{@game.gambler.want_card?}"
    puts "Взять карту: #{@game.dealer.want_card?.step}"
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
    choice = gets.chomp
    case choice
    when '1'
      card = @game.gambler.take_card(@game.deck.deal_card)
      puts "Вы взяли еще 1 карту#{@game.deck.deal_card}"
      card = @game.dealer.step(@game.deck)
    when '2'

    when '3'
    end
  end
end
