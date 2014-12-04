require './primes.rb'

describe Primes do
  it "Works trivially" do
    primes = Primes.new(1)
    expect(primes).to eq([2])
  end
end