numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# it will return
# 1
# 2
# 2
# 3
# => nil
# It does this because
# 1. uniq is not a mutating method.
# 2. puts returns nill
# 3. puts will printout numbers on each line because it calls to_s on the argument
# 3. p calls inspect [1, 2, 2, 3]
# puts numbers.inspect will print out the same as p
