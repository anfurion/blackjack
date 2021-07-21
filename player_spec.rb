require_relative 'player'
require_relative 'card'

RSpec.describe Player do
  subject { Player.new(100, 'Vasya') }
  let(:amount) { 10 }
  let(:card_jack) { Card.new(:clubs, :jack) }

  describe 'points' do
    let(:card_seven) { Card.new(:clubs, 7) }
    let(:card_king) { Card.new(:clubs, :king) }
    let(:card_ace) { Card.new(:clubs, :ace) }

    it 'equal zero when no cards' do
      expect(subject.points).to eq(0)
    end

    it 'summ values of cards in hand' do
      subject.take_card(card_jack)
      subject.take_card(card_seven)
      expect(subject.points).to eq(17)
    end

    it 'can handle an ace' do
      subject.take_card(card_ace)
      subject.take_card(card_jack)
      subject.take_card(card_seven)
      expect(subject.points).to eq(18)
    end
  end

  it 'can take a card' do
    expect(subject.hand).to be_empty
    subject.take_card(card_jack)
    expect(subject.hand).to include(card_jack)
  end

  it 'can drop  cards' do
    subject.take_card(card_jack)
    expect(subject.hand).to include(card_jack)
    subject.drop_cards
    expect(subject.hand).to be_empty
  end

  it 'player balance equal 100$' do
    expect(subject.balance).to eq(100)
  end

  it 'after won balance increases by amount' do
    # Ожидаем, что когда Вася выйграл 10
    # Его баланс изменится со 100 на 110
    expect { subject.won(amount) }
      .to change { subject.balance }
      .from(100).to(110)
  end

  it 'after bet placed balance decreases by amount' do
    expect { subject.bet(amount) }
      .to change { subject.balance }
      .from(100).to(90)
  end
end
