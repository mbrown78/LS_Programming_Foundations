#Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = Hash.new

flintstones.each_with_index do |item, index|
   hash[item] = index
end

p hash
#{"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}


hash2 = flintstones.each_with_object({}).with_index do |(element, hash), index|
  hash[element] = index
end

p hash2

#{"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}
