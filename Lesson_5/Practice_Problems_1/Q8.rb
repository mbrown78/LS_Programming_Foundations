#Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# loop threw all the values
# see if they include vowels
# if they include vowels p them
# format

hsh.each_value do |array|
  array.each do |sub_arr|
    sub_arr.chars.each do |letter|
      if 'aieou'.include?(letter)
        p letter
      end
    end
  end
end

vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

#a = ["t", "h", "e"]
#'aieou'.include?(a)


#a = [ "a", "b", "c" ]
#a.include?("b")   #=> true
