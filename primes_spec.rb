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
    primes = Primes.new(5)
    primes.compute
    expect(primes.all).to eq([2, 3, 5, 7, 11])
  end
  it "Can compute the first 100 primes (spot check these)" do
    primes = Primes.new(100)
    primes.compute

    expect(primes.all[0]).to eq(2)
    expect(primes.all[1]).to eq(3)
    expect(primes.all[2]).to eq(5)
    expect(primes.all[60]).to eq(283)
    expect(primes.all[99]).to eq(541)

    expect(primes.all.length).to eq(100)
  end
  it "Can compute the first 100,000 primes (check the last one)" do
    primes = Primes.new(100000)
    primes.compute

    expect(primes.all[99999]).to eq(1299709)
  end


end