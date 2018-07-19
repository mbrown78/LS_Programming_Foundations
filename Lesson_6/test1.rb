hash = {:suit=>"Spades", :value=>"10"}

hash.values.each do |hash|
   p hash
end

values = ["A", '2', '3', '4', '5', '6', '7', '8', '9', '10', "J", "Q", "K"]
suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
deck = []

hash = {}
count = 0

deck = []

suits.each do |suit|
  #values.size.times do |i |
  values.each do |value|
    deck << hash[suit] = value
    #hash <<  { suit: suit, value: value }
  end
end

p hash
