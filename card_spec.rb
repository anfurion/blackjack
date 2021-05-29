require_relative 'card'

RSpec.describe Card do
  subject { Card.new(suit, rank, show) }
  let(:suit) { :clubs }
  let(:rank) { :jack }
  let(:show) { true }

  describe 'values of cards' do
    context 'when card is numeric' do
      let(:rank) { 3 }

      it 'when points above 11' do
        expect(subject.value(13)).to eq(3)
      end

      it 'when points below 11' do
        expect(subject.value(7)).to eq(3)
      end
    end

    context 'when card is icon' do
      let(:rank) { :king }

      it 'when points above 11' do
        expect(subject.value(13)).to eq(10)
      end

      it 'when points below 11' do
        expect(subject.value(7)).to eq(10)
      end
    end

    context 'when card is ace' do
      let(:rank) { :ace }

      it 'when points above 11' do
        expect(subject.value(13)).to eq(1)
      end

      it 'when points is equal 11' do
        expect(subject.value(11)).to eq(1)
      end

      it 'when points below 11' do
        expect(subject.value(7)).to eq(11)
      end
    end
  end

  it 'valdates suit and rank on initialize' do
    expect { Card.new('black', 'joker') }.to raise_error(ArgumentError)
  end

  it 'knows a suit' do
    expect(subject.suit).to eq(suit)
  end

  it 'knows a rank' do
    expect(subject.rank).to eq(rank)
  end

  context 'can determine_order by rank' do
    it 'can determine_order of icons' do
      expect(subject.determine_order(:king)).to eq(13)
    end

    it 'can determine_order of numbers' do
      expect(subject.determine_order(7)).to eq(7)
    end
  end

  it 'knows an order' do
    expect(subject.order).to eq(11)
  end

  describe 'what we see when look on card' do
    context 'when card face is up' do
      it 'should return true for show' do
        expect(subject.show).to eq(true)
      end

      it 'should return the suit rank if show is true' do
        expect(subject.to_s).to eq("#{subject.rank} of #{subject.suit}.")
      end
    end

    context 'when card is face down' do
      let(:show) { false }

      it 'should not return the suit rank if show is false' do
        expect(subject.to_s).to eq('Card is face down right now')
      end
    end
  end
end
