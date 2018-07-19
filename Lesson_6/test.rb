require 'pry'
def result(players_total, dealer_total)
  if players_total > 21
    'player_busted'
  elsif dealer_total > 21
    'dealer_busted'
  elsif dealer_total > players_total
    'dealer'
  elsif players_total > dealer_total
    'player'
  else
    'tie'
  end
end

def update_score(player, dealer, players_total, dealer_total)
   winner = result(players_total, dealer_total)
    if winner == 'player' || winner == 'dealer_busted'
      player[:score] += 1
    elsif winner == 'dealer' || winner == 'player_busted'
      dealer[:score] += 1
    end
end

player = {
  score: 0
}

dealer = {
  score: 0
}

players_total = 20
dealer_total = 21

 result(players_total, dealer_total)
 p update_score(player, dealer, players_total, dealer_total)
 p "#{player}player"
 p "#{dealer}dealer"
