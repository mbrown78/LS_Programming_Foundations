# Shorten this sentence ...remove everything starting from "house".
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.index('house') # => 39  return the value from 0 to 39 after 39
# the variable is left with the rest house training .... etc
p advice.slice!(0, advice.index('house'))
# "Few things in life are as important as "
p advice
# "house training your pet dinosaur."
