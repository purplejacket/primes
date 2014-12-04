# Notes
# for n >=55 P(n) < n * (log n  +  log log n  + 2)
# Rosser, J.B. 1941
#    Explicit bounds for some functions of prime numbers. American Journal of Math., 63, 211--232.

class Primes

  attr_reader :size, :bound, :all

  def initialize n
    @first_54_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251]
    @size = n
    @bound = a_bound_for_the_nth_prime(n)
  end

  def a_bound_for_the_nth_prime(n)
    if n <= @first_54_primes.length
      @first_54_primes[n-1]
    else
      (n * (Math.log(n) + Math.log(Math.log(n)) + 2)).ceil
    end
  end

  def compute
    unless @all
      if @size <= @first_54_primes.length
        @all = @first_54_primes.take(@size)
      end
    end
  end

  def sieve_of_atkin
  end


end
