#Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arrb = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
arr = [[:a, 1],['b', 'two'],['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash = arr.each_with_object({}) do |(key, value ), arr|
   arr[key] = value
end
p hash
