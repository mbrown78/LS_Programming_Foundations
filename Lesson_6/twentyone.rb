def initialize_deck
  values = ["A", '2', '3', '4', '5', '6', '7', '8', '9', '10', "J", "Q", "K"]
  suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
  suits.product(values)
end

def deal_card(deck)
  hand = deck.sample
  deck.delete(hand)
  hand
end

def display_first_hand(player_cards, dealer_cards)
  p "You have #{player_cards[0][1]}"
  p "Dealer has #{dealer_cards[0][1]} "
end

def display_cards(player_cards, dealer_cards)
  p "                               "
  p "-----      This round     -----"
  p "|                                 "
  p "| You have: #{joiner(player_cards)}"
  p "| Dealer has: #{dealer_cards[0][1]} and unknown card."
  p "|                               "
  p "-------------------------------"
  p "                               "
end

def joiner(arr, delimiter=', ', word='and')
  case arr.size
  when 1 then arr[0][1]
  when 2 then arr[0][1] + " and " + arr[1][1]
  else
    cards = arr.map { |sub_a| sub_a[1] }
    cards[-1] = "#{word} #{cards.last}"
    cards.join(delimiter)
  end
end

def calculate_total(players_cards)
  royals = ["J", "Q", "K"]
  total = 0
  players_cards.each do |sub_arr|
    total += if sub_arr[1].to_i.to_s == sub_arr[1]
              sub_arr[1].to_i
            elsif royals.include?(sub_arr[1])
              10
            elsif total > 10
              1
            else
              11
            end
  end
  total
end

def busted?(card_hand)
  total = calculate_total(card_hand)
  total > 21
end

def who_busted(player_cards)
  calculate_total(player_cards) > 21 ? "You" : "Dealer"
end

def who_won(players_cards, dealer_cards)
  total_dealer = 21 - calculate_total(dealer_cards)
  total_player = 21 - calculate_total(players_cards)
  total_dealer > total_player ? "Player" : "Dealer"
end

def display_end_results(players_cards, dealer_cards)
  p "                                     "
  p "------------------------------------"
  p " ** ***      Game Over       *** ** "
  p "         The #{who_won(players_cards, dealer_cards)} won!"
  p "                                    "
  p "Player Total : #{calculate_total(players_cards)}"
  p "Dealer Total : #{calculate_total(dealer_cards)}"
end

loop do
  loop do
    system 'clear'
    deck = initialize_deck
    players_cards = [deal_card(deck)]
    dealer_cards = [deal_card(deck)]
    display_first_hand(players_cards, dealer_cards)

    loop do
      break if busted?(dealer_cards) || busted?(players_cards)
      puts "Please Choose 'hit' or 'stay'!"
      players_choice = gets.chomp
      break if players_choice == 'stay' || busted?(players_cards)
      players_cards << deal_card(deck)
      dealer_cards << deal_card(deck) if calculate_total(dealer_cards) < 17
      display_cards(players_cards, dealer_cards)
    end

    if busted?(players_cards) || busted?(dealer_cards)
      p"#{who_busted(players_cards)} busted."
      break
    else
      puts "You chose to stay!"
      loop do
        break if busted?(dealer_cards) || calculate_total(dealer_cards) >= 17
        dealer_cards << deal_card(deck) if calculate_total(dealer_cards) < 17
      end
      display_end_results(players_cards, dealer_cards)
    end
    break
  end
  p "                          "
  p "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 

p "Thank you for playing "
