#Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [3, 3, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
a = [[1, 2, 3], [2, 4, 6]]

b = a.select do |sub_arr|
    sub_arr.all? do |e|
      e.even?
    end
end

c = arr.select do |hash|
    hash.all? do |k, v| # all?
        v.all? do |e|
          e.even?
        end
    end
end
p b
p c
