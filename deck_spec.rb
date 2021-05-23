require_relative 'deck'

RSpec.describe Deck do
  before do
    @deck = Deck.new
  end

  it 'should respond to cards' do
    expect(@deck).to respond_to(:cards)
  end

  it 'should respond to shuffle' do
    expect(@deck).to respond_to(:shuffle)
  end

  it 'should respond to deal_card' do
    expect(@deck).to respond_to(:deal_card)
  end

  it 'pops off stack when card is dealt' do
    # shuffle deck, and pop card off the end of the deck = delt_card
    dealt_card = @deck.cards.last
    expect(@deck.deal_card).to eq(dealt_card)
  end

  it 'the delt_card cannot be nil' do
    expect(@deck.deal_card).to_not eq(nil)
  end
end
