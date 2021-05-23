require_relative 'player'

RSpec.describe Player do
  subject { Player.new(100, "Vasya") }
  let(:amount) {10}

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
