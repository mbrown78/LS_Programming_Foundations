
VALID_CHOICES = { r: 'rock',
                  p: 'paper',
                  s: 'scissors',
                  sp: 'spock',
                  l: 'lizard' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

WINNING_MOVES = { rock: ['scissors', 'lizard'],
                  paper: ['rock', 'spock'],
                  scissors: ['lizard', 'paper'],
                  spock: ['rock', 'scissors'],
                  lizard: ['spock', 'paper'] }

def win?(first, second)
  WINNING_MOVES[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt('The computer won this round!')
  else
    prompt('It is a tie!')
  end
end

# def reset_score(score1, score2)
#  score1 = 0
#  score2 = 0
# end

choice_score = 0
computer_score = 0

loop do
  loop do
    choice = ''
      loop do
        prompt("Choose one of the following: #{VALID_CHOICES.values.join(', ')}.
               Or you can choose #{VALID_CHOICES.keys.join(', ')}.")
        choice = Kernel.gets().chomp()

        if VALID_CHOICES.values.include?(choice)
          break
        elsif VALID_CHOICES.keys.include?(choice.to_sym)
          choice = VALID_CHOICES[choice.to_sym]
          break
        else
          prompt("That's not a valid choice")
        end
      end

      computer_choice = VALID_CHOICES.values.sample

      Kernel.puts("You chose: #{choice}. The computer chose: #{computer_choice}.")

      display_results(choice, computer_choice)

      if win?(choice, computer_choice)
        choice_score += 1
      elsif win?(computer_choice, choice)
        computer_score += 1
      end

      prompt("Players score is #{choice_score}")
      prompt("Computers score is #{computer_score}")

      if choice_score == 5
        prompt("You are the winner!")
        computer_score = 0
        choice_score = 0
      elsif computer_score == 5
        prompt("The computer is the winner")
        computer_score = 0
        choice_score = 0
      end

      # reset score method that didnt work
      #  if choice_score || computer_score == 5
      #    reset_score(choice_score, computer_score)
      #  end

      break if choice_score == 5 || computer_score == 5
      end

    prompt('Do you want to play again?')
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing, Goodbye!')
