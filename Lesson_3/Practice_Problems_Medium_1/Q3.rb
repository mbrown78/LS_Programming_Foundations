def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 # wont run the code on zero
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

factors(0)
