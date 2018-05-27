#What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
   number
  numbers.shift(1)
end

#

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end
#index  numbers      number
#"0    [1, 2, 3, 4]    1"
#"1    [2, 3, 4]       3"
