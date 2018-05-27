def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param # if we did not have the return value
  # the reassignement would not give the updated value
  # if we just put return the new values would be empty
end

my_string = "pumpkins"
my_array = ["pumpkins"]

# reassigning the values on line 14 to the return value of the method
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
