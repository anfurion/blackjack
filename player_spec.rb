require_relative 'player'
require_relative 'card'

RSpec.describe Player do
  subject { Player.new(100, 'Vasya') }
  let(:amount) { 10 }
  let(:card) { Card.new('Clubs', 'Jack') }

  it 'can take a card' do
    expect(subject.hand).to be_empty
    subject.take_card(card)
    expect(subject.hand).to include(card)
  end

  it 'can drop  cards' do
    subject.take_card(card)
    expect(subject.hand).to include(card)
    subject.drop_cards
    expect(subject.hand).to be_empty
  end

  it 'player balance equal 100$' do
    expect(subject.balance).to eq(100)
  end

  it 'after won balance increases by amount' do
    subject.won(amount)
    expect(subject.balance).to eq(110)
  end
  it 'after lose balance decreases by amount' do
    subject.lose(amount)
    expect(subject.balance).to eq(90)
  end
end
