You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

Test.assert_equals(find_outlier([0, 1, 2]), 1)
Test.assert_equals(find_outlier([1, 2, 3]), 2)
Test.assert_equals(find_outlier([2,6,8,10,3]), 3)

=begin
You are given an array (which will have a length of at least 3, but could be
very large) containing integers. The array is either entirely comprised of odd
integers or entirely comprised of even integers except for a single integer N.
Write a method that takes the array as an argument and returns N.
For example:
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11
[160, 3, 1719, 19, 11, 13, -21]
Should return: 160
=end

# My Solution
def find_outlier(integers)
  odd_val = []
  even_val = []
  integers.each {|x| x.odd? ? odd_val << x : even_val << x}
  odd_val.length == 1 ? odd_val[0] : even_val[0]
end

# Better Solution
def find_outlier(integers)
  integers.partition(&:odd?).find(&:one?).first
end


def find_outlier(arr)
  a, b = arr.partition { |ele| ele.even? }
  a.length == 1 ? a[0] : b[0]
end

p find_outlier([0, 1, 2]) # 1
# p find_outlier([1, 2, 3]) # 2
# p find_outlier([2,6,8,10,3]) # 3

# find the index of those vowels and return them

def find_vowels(string)
  location = []
  lower_case_str = string.downcase
  lower_case_str.chars.each_with_index do |c,i|
    if ['a','e','i','o','u','y'].include?(c)
      location << i+1
    end
  end
  location
end


p find_vowels('Apple')
p find_vowels('Apple') == [1, 5]
p find_vowels('YoMama')
