
# the problem is limit is defined outside of the method. Methods do not have access to any local variables defined outside of their scope

# you can either pass the limit as an additional argument or intialize
# the variable within the method itself
def fib(first_num, second_num)
  limit = 15

  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
