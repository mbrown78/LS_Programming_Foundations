#Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

#{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
hash = {}
array1 = statement.chars.uniq
array1.delete(' ')
array1.each do |i|
    number = statement.count(i)
    hash[i] = number
end

p hash

# need to delete white space in the array
array = statement.chars.uniq
array.delete(' ')
answer = array.each_with_object({}) do |element, h|
  number = statement.count(element)
  h[element] = (number)
end

p answer

characters = statement.chars
characters.delete(' ')
new_hash = {}
characters.each do |e|
   characters.count(e)
   new_hash[e] = characters.count(e)
end

p new_hash
