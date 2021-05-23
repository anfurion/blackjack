require_relative 'gambler'

RSpec.describe Gambler do
  subject { Gambler.new(100, 'Yana') }
  let(:amount) { 10 }

  it 'gambler balance equal 100$' do
    expect(subject.balance).to eq(100)
  end

  it 'has a name' do
    expect(subject.name).to eq('Yana')
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
