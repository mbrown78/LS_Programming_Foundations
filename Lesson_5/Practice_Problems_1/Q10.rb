
#Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_array = arr.map do |hash|
     hash.transform_values do |value|
       value + 1
     end
end

p new_array
#[{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]


# change the values
new_keys = arr.map do |hash|
     changed_keys = {}
     hash.each do |key, value|
       changed_keys[key.to_s.upcase] = value
     end
     changed_keys
end
p new_keys
#[{"A"=>1}, {"B"=>2, "C"=>3}, {"D"=>4, "E"=>5, "F"=>6}]

# using each with object
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
