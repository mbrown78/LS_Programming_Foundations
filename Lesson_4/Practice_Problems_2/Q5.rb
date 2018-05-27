
#Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# loop through the array if
# element[0] = b
# return element.index

# return value of each_with_index is not 3 but the original collection
# the return value from each_with_index is ignored
# you can use each_with_index to print the value
# but .index is necessary if you want the return value 
flintstones.each_with_index do |element, index|
  if element[0..1] == "Be"
    index
  end
end

flintstones.each_with_index do |element, index|
   index if element[0..1] == 'Be'
end

flintstones.index { |name| name[0, 2] == "Be" }
