require './primes.rb'

describe Primes do
  it "tells you how big it is" do
    primes = Primes.new(33)
    expect(primes.size).to eq(33)
  end
  it "Given n, it tells you an upper bound for P(n)" do
    primes = Primes.new(10)
    expect(primes.bound).to eq(29)
    primes = Primes.new(55)
    expect(primes.bound).to eq(407)
  end
  it "Works trivially" do
    primes = Primes.new(1)
    primes.compute
    expect(primes.all).to eq([2])
  end
  it "Works slightly less trivially" do
    primes = Primes.new(2)
    primes.compute
    expect(primes.all).to eq([2, 3])
  end
  it "Can compute the first 100 primes (spot check these)" do
    primes = Primes.new(100)
    primes.compute
    expect(primes.all[60]).to eq(283)
    expect(primes.all[99]).to eq(541)
  end


end