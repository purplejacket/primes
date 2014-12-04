require './primes.rb'

describe Primes do
  it "tells you how big it is" do
    primes = Primes.new(33)
    expect(primes.size).to eq(33)
  end
  it "Given n, it tells you an upper bound for P(n)" do
    primes = Primes.new(55)
    expect(primes.bound).to eq(407)
    primes = Primes.new(10)
    expect(primes.bound).to eq(29)
  end
  it "Works trivially" do
    primes = Primes.new(1)
    expect(primes).to eq([2])
  end
end