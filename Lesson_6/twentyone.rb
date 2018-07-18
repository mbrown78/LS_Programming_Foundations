def prompt(msg)
  puts "=> #{msg}"
end

def valid_choice?(choice)
  choice.downcase == 'hit' || choice.downcase == 'stay'
end

def initialize_deck
  values = ["A", '2', '3', '4', '5', '6', '7', '8', '9', '10', "J", "Q", "K"]
  suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
  deck = []
  values.each do |value|
    suits.each do |suit|
      deck.push({ suit: suit, value: value })
    end
  end
  deck
end

def deal_card(deck)
  hand = deck.sample
  deck.delete(hand)
  hand
end

def display_first_hand(player_cards, dealer_cards)
  p "You have #{player_cards[0][:value]}"
  p "Dealer has #{dealer_cards[0][:value]} "
end

def display_cards(player_cards, dealer_cards)
  p "                               "
  p "-----      This round     -----"
  p "|                                 "
  p "| You have: #{joiner(player_cards)}"
  p "| Dealer has: #{dealer_cards[0][:value]} and unknown card."
  p "|                               "
  p "-------------------------------"
  p "                               "
end

def joiner(arr, delimiter=', ', word='and')
  case arr.size
  when 1 then arr[0][:value]
  when 2 then arr[0][:value] + " and " + arr[1][:value]
  else
    cards = arr.map { |card| card[:value] }
    cards[-1] = "#{word} #{cards[-1]}"
    cards.join(delimiter)
  end
end

def standard_card?(card)
  card[:value].to_i.to_s == card[:value]
end

def face_card?(card)
  royals = ["J", "Q", "K"]
  royals.include?(card[:value])
end

def how_many_aces(cards)
  count = 0
  cards.each do |hash|
    count += 1 if hash[:value] == "A"
  end
  count
end

def ace?(card)
  card[:value] == 'A'
end

def calculate_ace(total, number_of_aces)
  ace_value = 0
  if number_of_aces >= 2 && total < 10
    11 + ((number_of_aces - 1) * 1)
  elsif total > 10
    ace_value +=  1
  else
    ace_value += 11
  end
  ace_value
end

def calculate_total(players_cards)
  total = 0
  number_of_aces = how_many_aces(players_cards)

  players_cards.each do |card|
    total += if standard_card?(card)
               card[:value].to_i
             elsif face_card?(card)
               10
             elsif ace?(card)
               calculate_ace(total, number_of_aces)
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
    prompt "Welcome to the game 'Twenty One.' The aim of the game"
    prompt "is to get as prompt close to 21 without going over."
    prompt "You can chose to hit to receive a new card or stay."
    prompt "The numbers 2 through 10 are worth their face value."
    prompt "The jack, queen, and king are each worth 10, and the ace"
    prompt "can be worth 1 or 11"

    deck = initialize_deck
    players_cards = [deal_card(deck)]
    dealer_cards = [deal_card(deck)]
    display_first_hand(players_cards, dealer_cards)

    loop do
      break if busted?(dealer_cards) || busted?(players_cards)
      players_choice = ''
      loop do
        prompt "Please Choose 'hit' or 'stay'!"
        players_choice = gets.chomp
        break if valid_choice?(players_choice)
        prompt('Hmmm.... that doesnt look like a valid choice')
      end
      system 'clear'
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
  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

p "Thank you for playing "
