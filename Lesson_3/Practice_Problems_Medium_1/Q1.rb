flintstones = "The Flintstones Rock!"

#10.times do |number|
#  puts (" " * number) + "The Flintstones Rock!"
# end

#10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

3.times do |k|
   puts "Number #{k+1}"
   #   times will start at 0, so on the 10th iteration, k is equal to 9
end

3.times{ |k| puts "Number #{k + 1 }"}
# => returns 3

2.times do
  puts 'hello'
end

2.times { puts 'hello'} #=> returns 2

10.times { |number| puts  "The Flintstones Rock!" + (" as" * number ) + " #{number + 1}"  }
