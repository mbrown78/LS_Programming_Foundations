

def calculate_ace(total, number_of_aces)
  ace_value = 0
  if number_of_aces >= 2 && total < 10
    p  11 + ((number_of_aces - 1) * 1)
  elsif total > 10
    ace_value +=  1
  else
    ace_value += 11
 end
 ace_value
end

p calculate_ace(8,2)




# how many values == 'A'

 #[{:suit=>"Spades", :value=>"5"}]
 #[{:suit=>"Spades", :value=>"5"}, {:suit=>"Spades", :value=>"2"}]

=begin
values = ["A", '2', '3', '4', '5', '6', '7', '8', '9', '10', "J", "Q", "K"]
suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
deck = []

hash = {}
count = 0

suits.each do |suit|
  values.size.times do |i |
    p values[i]
    p suit
    hash[suit] = values[i]
end
=end
