require './primes.rb'

describe Primes do
  it "tells you how big it is" do
    primes = Primes.new(33)
    expect(primes.size).to eq(33)
  end
  it "Works trivially" do
    primes = Primes.new(1)
    expect(primes).to eq([2])
  end
end