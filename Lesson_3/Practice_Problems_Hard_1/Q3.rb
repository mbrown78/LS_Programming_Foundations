def mess_with_vars(one, two, three)
  one = "two"
  puts "inside method id #{one.object_id}"
  two = "three"
  three = "one"
end

one = "one"
puts "outside method id #{one.object_id}"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"


# will not change = outside the method call we still have the same values and the same ids. Parameter variables inside the method have no relationship to those outside the method. Parameter values are seperate.
