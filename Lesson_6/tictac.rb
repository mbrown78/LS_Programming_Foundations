#The logic is simple: if the computer already has 2 in a row, then fill in the 3rd square, as opposed to moving at random.

require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # col
                [[1, 5, 9], [3, 5, 7]]

scores = { player: 0, computer: 0}

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/MethodLength, Metrics AbcSize
def display_board(brd, scores)
  system 'clear'
  puts "Your are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "First to 5 wins the game"
  puts "SCORE Player: #{scores[:player]} Computer: #{scores[:computer]}"
  puts "      |       |      "
  puts "   #{brd[1]}  |   #{brd[2]}   |   #{brd[3]}   "
  puts "      |       |      "
  puts "----- + ----- + -----"
  puts "      |       |      "
  puts "   #{brd[4]}  |   #{brd[5]}   |   #{brd[6]}   "
  puts "      |       |      "
  puts "----- + ----- + -----"
  puts "      |       |      "
  puts "   #{brd[7]}  |   #{brd[8]}   |   #{brd[9]}   "
  puts "      |       |      "
  puts ""
end
# rubocop: enable Metrics/MethodLength Metrics/AbcSize

# Returns a hash
def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_square(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
  # will return an array of integers that represent the empty squares.
end

# modification to Array#join used in `person_places_piece!`
def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# modifies the hash
def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece:#{joinor(empty_square(brd), ', ')}"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if !!find_at_risk_square(brd, COMPUTER_MARKER) == true
    brd[find_at_risk_square(brd, COMPUTER_MARKER)] = COMPUTER_MARKER
  elsif !!find_at_risk_square(brd, PLAYER_MARKER) == true
    brd[find_at_risk_square(brd, PLAYER_MARKER)] = COMPUTER_MARKER
  else
    square = empty_square(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def find_at_risk_square(brd, marker)
  threat = []
  WINNING_LINES.select do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
     threat << line.select {|square| brd[square] == INITIAL_MARKER}
    end
  end
  threat.empty? ? nil : threat[0][0]
end

def board_full?(brd)
  empty_square(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # output is a boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def keep_score!(brd,scores)
  if detect_winner(brd) == "Computer"
     scores[:computer] += 1
  elsif detect_winner(brd) == "Player"
     scores[:player] += 1
  end
end

# improve method take result of declare Winner to boolean form
def reset_score!(scores)
  if scores[:player] == 2 || scores[:computer] == 2
   scores[:player] = 0
   scores[:computer] = 0
  end
end


def declare_winner(scores)
  if scores[:player] == 2
    "Player is the Winner"
  elsif scores[:computer] == 2
    "Computer is the winner"
  else
    "This round Player Score = #{scores[:player]} Computer Score = #{scores[:computer]}"
  end
end


loop do
  board = intialize_board
  reset_score!(scores)
  loop do
    display_board(board, scores)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  keep_score!(board, scores)
  display_board(board,scores)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    prompt "#{declare_winner(scores)}"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
