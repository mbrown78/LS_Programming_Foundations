
arr = ['10', '11', '9', '7', '8']

a = arr.map do |num|
    num.to_i
  end

b = a.sort do |a,b|
     a <=> b
end
p a
p b

  arr.sort do |a, b|
    a <=> b
  end

d = arr.map do |num|
    num.to_i.sort do |a , b|
      a <=> b
    end
  end

p d

# why doesnt it work
numbers = [1, 1, 2]
numbers.each do |n|
     start ||= n
      if start != n
        next
      else
        n == start
      end
    start
   end


   def stray(array)
     saved = nil
     array.select do |n|
       saved ||= n
      if saved == n
        next
      else
        saved = n
       end
     saved
     end
   end
   p stray([1, 1, 2]) #== 2
   p stray [17, 17, 3, 17, 17, 17, 17] #== 3

   Rules for a smiling face:
-Each smiley face must contain a valid pair of eyes. Eyes can be marked as : or ;
-A smiley face can have a nose but it does not have to. Valid characters for a nose are - or ~
-Every smiling face must have a smiling mouth that should be marked with either ) or D.
No additional characters are allowed except for those mentioned.
Valid smiley face examples:
:) :D ;-D :~)
Invalid smiley faces:
;( :> :} :]

Example cases:

countSmileys([':)', ';(', ';}', ':-D']);       // should return 2;
countSmileys([';D', ':-(', ':-)', ';~)']);     // should return 3;
countSmileys([';]', ':[', ';*', ':$', ';-D']); // should return 1;


# def remove_smallest(array)
#   return array if array.empty?
#   a = array
#   index_of_min = array.index(array.min)
#   a.delete_at(index_of_min)
#   a
# end
#
#
#
# p remove_smallest([1,2,1]) == [2,1]
#
# p remove_smallest([1,2,3,4,5])
# p remove_smallest([1,2,3,4,5]) == [2,3,4,5]
# p remove_smallest([5,3,2,1,4]) == [5,3,2,4]
# p remove_smallest([2,2,1,2,1]) == [2,2,2,1]
#
# # You probably know the "like" system from Facebook and other pages.
# # People can "like" blog posts, pictures or other items. We want to
# # create the text that should be displayed next to such an item.
#
# # Implement a function likes :: [String] -> String, which must take in
# # input array, containing the names of people who like an item.
# # It must return the display text as shown in the examples:
#
# def likes(arr)
#   return "no one likes this" if arr.empty?
#   if arr.count == 1
#     arr.first + " likes this"
#   else if arr.count == 2
#     names = arr.join("")
#   else if arr.count == 3
#     #
#   else
#     #
#   end
#
# end
#
# p likes([]) == "no one likes this"
# p likes(["Peter"]) == "Peter likes this"
# p likes(["Jacob", "Alex"])
# p likes(["Jacob", "Alex"]) == "Jacob and Alex like this"
# # p likes(["Max", "John", "Mark"]) == "Max, John and Mark like this"
# # p likes(["Alex", "Jacob", "Mark", "Max"]) == "Alex, Jacob and 2 others like this"
# str = "joe's favorite color is blue"
# str[0] = 'J'
# str # => "Joe's favorite color is blue"
# a = str.split(' ')
# a.map { |i| i.capitalize! }
# p a

loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
