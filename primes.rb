require 'bitarray'

class Primes
  attr_reader :n, :bound, :all, :actual_size
  alias :size :n

  def initialize n
    @n = n
    @first_54_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251]
    @bound = a_bound_for_the_nth_prime(n)
  end

  def a_bound_for_the_nth_prime(n)
    # for n >=55 P(n) < n * (log n  +  log log n  + 2)
    # Rosser, J.B. 1941
    #    Explicit bounds for some functions of prime numbers. American Journal of Math., 63, 211--232.
    if n <= @first_54_primes.length
      @first_54_primes[n-1]
    else
      (n * (Math.log(n) + Math.log(Math.log(n)) + 2)).ceil
    end
  end

  def compute
    unless @all
      if @n <= @first_54_primes.length
        @all = @first_54_primes.take(n)
      else
        sieved_numbers = sieve_of_eratosthenes(@bound)
        @all = n_primes(sieved_numbers)
      end
    end
  end

  def sieve_of_eratosthenes bound
    bitarray = BitArray.new(bound+1)

    (4..bound).step(2) {|composite_num| bitarray[composite_num] = 1}

    sqrt = Math.sqrt(bound).ceil

    (3..sqrt).each do |i|
      if(bitarray[i] == 0)
        (i*i..bound).step(2*i) {|composite_num| bitarray[composite_num] = 1}
      end
    end

    bitarray
  end

  def n_primes(sieve)
    primes = []
    sieve.each_with_index do |isPrime, index|
      primes << index if isPrime == 0
    end
    primes[2..(@n+1)]
  end
end
