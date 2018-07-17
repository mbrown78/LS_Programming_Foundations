a = [["Spades", "Q"], ["Spades", 3]]
b = [["Diamonds", 9], ["Hearts", 8]]

def joiner(arr, delimiter=', ', word='and')
  case arr.size
  when 1 then arr[0][1]
  when 2 then arr[0][1] + " and " + arr[1][1]
  else
    cards = arr.map { |sub_a| sub_a[1]}
    cards[-1] = "#{word} #{cards.last}"
    cards.join(delimiter)
  end
end

p joiner(a)
