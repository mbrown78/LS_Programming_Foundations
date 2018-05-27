#What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

#Returns a new array containing the items in self for which the given block is not true.

# the return value of puts is nil which is not false therefore it will
#return all the values in the original array

# if puts was taken out of the code it would reject all elements and
# return an empty array.
