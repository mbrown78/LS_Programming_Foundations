#Practice Problem 13
#Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically according to the numeric value of the odd integers they contain.

arr = [[1, 'b', 7], [1, 'a', 9], [1, 'c', 3]]
#The sorted array should look like this:
#[[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
# sort automatically sort therefore need to select criteria 
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

new_array = arr.sort_by do |sub_arr|   #sort automatically sorts
  sub_arr[1] # sort by a specific element
end

p new_array
