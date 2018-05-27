# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end


#the reuturn value is => {"a"=>"ant", "b"=>"bear", "c"=>"cat"}
# each_with_object is from the enumerable module
# it iterates the given block for each element with an arbitrary object, obj, and returns obj
# In our case it returns the object it was first given full as the argument and  places the values from the evaluated block witin the object. 
#({}) in the brackets is the type of object specified that we want to return in
# our case its a hash
# value is the first value in the arbitrary
# and the second object is the object we specified in the method argument
# value[0]  > is the same as array[0][0] which gives us 'a' on the first value
# remember that value is already the value of ant because we are looping through
# each element the array
# then   hash[value[0]] = value we are setting the key to 'a' and the value to 'ant'
# this pattern of the first letter of the element in the array and the whole element set as the value continues on each iteration.
