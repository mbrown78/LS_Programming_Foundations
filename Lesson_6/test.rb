

player = {
  score: 2
}

dealer = {
  score: 5
}

def reset_score(player, dealer)
  dealer[:score] = 0
  player[:score] = 0
end

p player
p dealer 

p reset_score(player, dealer)
p player
p dealer
