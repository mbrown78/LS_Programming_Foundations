#Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# iterate through the hash GET the value
# sum up all the value
# return a number

#first try
array_of_values = ages.values #[32, 30, 5843, 10, 22, 237]
sum = 0
array_of_values.each do |element|
  sum += element
end
p sum # 6174

# second try
sum2 = 0
ages.each_value do |v|
  sum2 += v
end
p sum2 # 6174

# third try
p ages.values.inject(:+) # => 6174

# LS
total_ages = 0
ages.each { |key,age| total_ages += age }
p total_ages # => 6174
