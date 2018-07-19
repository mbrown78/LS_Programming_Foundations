WINNING_VALUE = 27

player_total = 38
dealer_total = 48

def who_won(player_total, dealer_total)
  who = result(player_total, dealer_total)
  case who
  when :player_busted then 'dealer won'
  when :dealer_busted then 'player won'
  when :dealer        then 'dealer won'
  when :player        then 'player won'
  else
    "It's a Tie"
  end
end

def result(player_total, dealer_total)
  if player_total > WINNING_VALUE
    :player_busted
  elsif dealer_total > WINNING_VALUE
    :dealer_busted
  elsif dealer_total > player_total
    :dealer
  elsif player_total > dealer_total
    :player
  else
    :tie
  end
end

p result(player_total, dealer_total)
p who_won(player_total, dealer_total)
