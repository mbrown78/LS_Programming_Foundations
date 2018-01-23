# Input
# - the loan amount
# - the Annual Percentage Rate (APR)
# - the loan duration

# Output
# - monthly interest rate
# - loan duration in months

# Algorithim
# - GET loan amount
#  -validate Input is a integer
# - GET anuual interest rate
#   - validate input
#   - SET  to decimal
# SET the monthly_interest_rate => divide annual interest rate by 12
# - GET loan duration
# - SET loan duration to months
# - Calculate  monthly_payment
# - P monthly_payment and loan duration in months.

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end
loop do
  prompt('Welcome to the Car Loan Calculator! Please enter your loan amount')

  loan_amount = ''

  loop do
    loan_amount = Kernel.gets.chomp
    break if integer?(loan_amount)
    prompt('Hmmm.... that doesnt look like a valid number')
  end

  prompt('Please enter your annual interest_rate')

  annual_interest_rate = ''

  loop do
    annual_interest_rate = Kernel.gets.chomp
    break if valid_number?(annual_interest_rate)
    prompt('Hmmm.... that doesnt look like a valid number')
  end

  prompt('What is the loan duration?')

  loan_duration = ''

  loop do
    loan_duration = Kernel.gets.chomp
    break if valid_number?(loan_duration)
    prompt('Hmmm.... that doesnt look like a valid number')
  end

  loan_amount = loan_amount.to_i
  annual_interest_rate = annual_interest_rate.to_f / 100
  loan_duration = loan_duration.to_i
  monthly_interest_rate = annual_interest_rate / 12
  months = loan_duration * 12

  # Formula
  monthly_payment = loan_amount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months))

  total_cost = months * monthly_payment

  prompt("Your monthly payment is $#{monthly_payment.round(2)}\n
    for a duration of #{months} months or\n
    #{loan_duration} years. The total cost of your loan is\n
    $#{total_cost.round(2)}")

  prompt("Do you want to perform another calucation? (Y to calucate again)")
  answer = Kernel.gets.chomp
  break unless answer.downcase().start_with?('y')
end
prompt("Thank you for using calucator!")
