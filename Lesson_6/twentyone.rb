require 'pry'

WINNING_VALUE = 27
DEALER_CAP = WINNING_VALUE - 4

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

def calculate_total(player_cards)
  total = 0
  number_of_aces = how_many_aces(player_cards)

  player_cards.each do |card|
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

def busted?(user_total)
  user_total > WINNING_VALUE
end

def who_won(player_total, dealer_total)
  who = result(player_total, dealer_total)
  case who
  when :player_busted then 'The dealer won'
  when :dealer_busted then 'The player won'
  when :dealer        then 'The dealer won'
  when :player        then 'The player won'
  else
    "It's a Tie"
  end
end

def who_busted(player_cards)
  calculate_total(player_cards) > WINNING_VALUE ? "You" : "Dealer"
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

def update_score(player, dealer, player_total, dealer_total)
  winner = result(player_total, dealer_total)
  if winner == :player || winner == :dealer_busted
    player[:score] += 1
  elsif winner == :dealer || winner == :player_busted
    dealer[:score] += 1
  end
end

def display_overall_score(player)
  if player[:score] == 5
    p "Congratulations you won"
  else
    p "Better luck next time"
  end
end

def display_score(player, dealer)
  p "Your score is #{player[:score]}. Dealer score is #{dealer[:score]}. "
end

def game_over?(player, dealer)
  player[:score] == 5 || dealer[:score] == 5
end

player = {
  score: 0
}

dealer = {
  score: 0
}

def display_round_results(player_total, dealer_total)
  p "                                     "
  p "------------------------------------"
  p " ** ***      Game Over       *** ** "
  p "         #{who_won(player_total, dealer_total)}!"
  p "                                    "
  p "Player Total : #{player_total}"
  p "Dealer Total : #{dealer_total}"
end

loop do
  deck = initialize_deck
  player_cards = [deal_card(deck)]
  dealer_cards = [deal_card(deck)]
  player_total = 0
  dealer_total = 0

  if player[:score] == 0 && dealer[:score] == 0
    prompt "Welcome to the game 'Whatever-One.' ßThe aim of the game"
    prompt "is to get as close to 'Whatever-number' without going over."
    prompt "You can chose to hit to receive a new card or stay."
    prompt "The numbers 2 through 10 are worth their face value."
    prompt "The jack, queen, and king are each worth 10, and the ace"
    prompt "can be worth 1 or 11. Your number is 27"
    p "                                           "
  end
  display_first_hand(player_cards, dealer_cards)

  loop do
    loop do
      player_total = calculate_total(player_cards)
      dealer_total = calculate_total(dealer_cards)
      break if busted?(dealer_total) || busted?(player_total)
      player_choice = ''
      loop do
        prompt "Please Choose 'hit' or 'stay'!"
        player_choice = gets.chomp
        break if valid_choice?(player_choice)
        prompt('Hmmm.... that doesnt look like a valid choice')
      end
      system 'clear'
      break if player_choice == 'stay' || busted?(player_total)
      player_cards << deal_card(deck)
      dealer_cards << deal_card(deck) if dealer_total < DEALER_CAP
      display_cards(player_cards, dealer_cards)
    end

    if busted?(player_total) || busted?(dealer_total)
      p "#{who_busted(player_cards)} busted."
    else
      p "You chose to stay!"
      loop do
        break if busted?(dealer_total) || dealer_total >= DEALER_CAP
        dealer_cards << deal_card(deck) if dealer_total < DEALER_CAP
        dealer_total = calculate_total(dealer_cards)
      end
    end

    display_round_results(player_total, dealer_total)
    update_score(player, dealer, player_total, dealer_total)
    display_score(player, dealer)
    break
  end

  if game_over?(player, dealer)
    display_overall_score(player)
    prompt "Do you want to play again?"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
    dealer[:score] = 0
    player[:score] = 0
  end
end

p "Thank you for playing "
