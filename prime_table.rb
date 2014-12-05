#!/usr/bin/env ruby

require './primes.rb'

class PrimesTable
  def initialize(size)
    @size = size
    primes = Primes.new(size)
    primes.compute
    @primes = primes.all
  end

  def show
    print "\t " + " | "
    (1..@size).each {|i| print "\t" + @primes[i-1].to_s}
    puts
    puts "-" * @size * 9

    (1..@size).each do |row|
      (1..@size).each do |col|
        if col == 1
          print "\t" + @primes[row-1].to_s + " | "
        end
        print "\t" + (@primes[row-1] * @primes[col-1]).to_s
      end
      puts
    end
  end
end

size = ARGV.length == 0 ? 10 : ARGV[0].to_i
table = PrimesTable.new(size)
table.show