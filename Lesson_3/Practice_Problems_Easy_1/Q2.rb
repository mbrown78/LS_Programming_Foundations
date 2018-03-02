# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# what is != and where should you use it?

# means not equal
 1 != 2 # => true

# put ! before something, like !user_name
# The not-operator (!) takes true values and makes them false or false values and makes them true.
a = true
!a
=> false

# put ! after something, like words.uniq!
# makes the method a mutating method

# put ? before something
# if_this_is_a_true_value ? then_the_result_is_this : else_it_is_this
puts 1 ? 2 : 3  => 2

# put ? after something
# Naming convention : method will return a boolean value by convention

# put !! before something, like !!user_name
# The second bang then flips the resultant Boolean back to the appropriate value.

b = false
 !b
=> true
!!b
=> false
