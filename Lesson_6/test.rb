require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = '0'

board = {1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>"0" , 9=>" "}

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # col
                [[1, 5, 9], [3, 5, 7]]
line = [4, 5, 6]


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


def empty_square(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
  # will return an array of integers that represent the empty squares.
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


p board
 computer_places_piece!(board)
p "----"
p board
