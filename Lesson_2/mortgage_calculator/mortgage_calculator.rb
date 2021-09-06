=begin
# PEDAC for mortgage calculator

# # Problem - build a mortgage calculator

# Input 
# 1. Loan amount
# 2. Annual Percentage Rate (APR)
# 3. Loan duration

# Output
# 1. Monthly interest rate
# 2. Loan duration in months
# 3. Monthly payment

# Given -
# Formula for the calculator:

# M = p * ( j / 1 - ( 1 + j ) ** ( -n )))

# M = monthly payment
# P = loan amount
# J = monthly interest rate
# N = loan duration in months

# Monthly payment = (loan amount) * ( (monthly interest rate / 1) - ( 1 + monthly interest rate) ** ( - (loan duration in months)))

# Explicit requirements
# - Dont use single letter variables like m, p, j, n. Instead use explicit names like “loan amount”
# - Run code through Rubocop before submitting
# - For APR - Needs to be converted to monthly interest rate
# - Loan Duration - be careful about months vs. years and choose appropriate variable names to help
# - Be aware of input type - How do I want to represent 5%? (5 vs 0.05)

# Implicit requirements
# - Language used is Ruby
# - How do I convert APR to monthly interest rate?
  - Convert the APR from percentage to decimal
  - Divide the APR by 12
  - Multiply by 100 to convert to percent
# Clarifying questions
# - What does that formula do? 
#   - Based on business insider, it calculates my monthly mortgage payment
# - Are the 3 inputs - loan amount, APR, and Loan duration custom numbers given by the user?
#   - Based on calculator.net (given calculator to compare to), all 3 inputs are inputted by user
# - Are the three outputs expected to be shown at the same time?
#   - Yes, all three are expected to output at the end

# # E - Examples and Tests

# - Example of a loan calculator -  https://www.calculator.net/loan-calculator.html

# # Data Structure

# - Input
#   Integer - 1. Loan amount
#   Percent - 2. Annual Percentage Rate (APR)
#   Integer - 3. Loan duration

# - Output
#   Percent -  1. Monthly interest rate
#   Integer -  2. Loan duration in months
#   Integer or Float - 3. Monthly payment

# - In-between 
#   - Conversion from Integer to Float 

# # Algorithm - SIMPLE PLAIN ENGLISH
# - 
- Ask user for 
  - 1) loan amount, 
  - 2) annual percentage rate, 
    user_input_APR.to_f.to_s == user_input_APR - this doesn't catch integers because 200 is 200.0 on the left side
  - 3) loan duration - What should format be? - Hash?
    How is a hash created?
    hash = {years: 10, months: 10}

- Validate each of the three inputs as they are inputted to ensure they are of the correct data type and numbers.
  - I can store the 3 inputs into a hash
- If user gives invalid inputs then ask user again to give correct number
- Store the 1) Loan amount, 2) Annual Percentage Rate, 3) Loan duration into separate containers

  # - 9/2 END - better input validation needed

- Make the appropriate conversions for each input if necessary to be compatible with the loan formula
  - loan amount must be an integer or float
  - APR must be an integer or float
  - loan duration must be an integer (years and months) 
- Process the inputs within the formula
- Store the outputs of the formula into a new container
- If necessary, convert the output into the appropriate data type
- Then display the results of the 1) monthly interest rate, 2) loan duration in months, 3) monthly payment to user
- Ask user if they want to calculate another loan payment
 
  # - 9/5

# CODE with intent - If you find that your algorithm doesn't work, return there FIRST and THEN fix your code
# TEST FREQUENTLY
# The key is to be in control of what you're doing the whole time
# When testing your code, always have an idea in place of what you're expecting

PSEUDOCODE  KEYWORD              MEANING
            START                start of the program
            SET                  sets a variable we can use for later
            GET                  retrieve input from user
            PRINT                displays output to user
            READ                 retrieve value from variable
            IF / ELSE IF / ELSE  show conditional branches in logic
            WHILE                show looping logic
            END                  end of the program


START
PRINT to user welcome to mortgage calculator
SET loan amount 
SET APR
SET loan duration in (years, months)

WHILE

  WHILE 
    PRINT to user for loan amount (in an integer or float, no dollar sign)
    GET loan amount from user
    SET loan amount to variable
    
    IF loan amount is a valid integer or float
      BREAK
    ELSE
      PRINT to user to give valid input
 
  WHILE 
    PRINT to user for APR (integer or float, no percent sign)
    GET APR from user
    SET APR to variable
    
    IF APR is a valid integer or float
      BREAK
    ELSE
      PRINT to user to give valid input
      
  WHILE 
    PRINT to user for loan duration in (years, months=0) format, months optional
    GET loan duration from user
    SET loan duration to variable
    
    IF loan duration is a valid integer
      BREAK
    ELSE
      PRINT to user to give valid input

  SET loan duration in months (N) - loan duration * 12 months
  SET monthly interest rate (J) - APR / 12 months
  SET monthly payment (M) to output of: (loan amount) * ( (monthly interest rate / 1) - ( 1 + monthly interest rate) ** ( - (loan duration in months)))

  PRINT to user
   1. Monthly interest rate
   2. Loan duration in months
   3. Monthly payment

  PRINT to user asking if they want to calculate another mortgage loan.

    IF user says yes
      Go back to beginning 
    ELSE
      PRINT to user thanking them 
      BREAK

END

********** EDGE CASES **********
-user_input_apr not accepting integers because of the way input is being validated

REFACTORING:
- CLEARER INSTRUCTIONS
DONE - YAML FILE
- METHOD REFACTORING
- RUBOCOP
DONE - Rounding numbers 
- Clear screen
- Give total interest paid
- SLEEP TIMER
=end



require 'yaml'
MESSAGES = YAML.load_file('prompts.yml')

def prompt(input)
  puts ">>> #{input}"
end

def duration_in_months(input)
  (input[0].to_i * 12) + (input[1].to_i)
end

prompt(MESSAGES['welcome'])
sleep(1)

user_input_loan_amount = nil
user_input_apr = nil
user_input_loan_duration = nil

loop do

  prompt(MESSAGES['input_total_loan'])
  loop do 
    user_input_loan_amount = gets.chomp
    if (user_input_loan_amount.to_i.to_s == user_input_loan_amount) && (user_input_loan_amount.to_i > 0)
      break
    else 
      prompt(MESSAGES['input_total_loan_error'])
    end
  end

  prompt(MESSAGES['input_apr'])
  loop do 
    user_input_apr = gets.chomp
    if (user_input_apr.include?('.')) && (user_input_apr.to_i > 0)
      user_input_apr.to_f.to_s == user_input_apr
      break
    elsif (user_input_apr.to_i.to_s == user_input_apr) && (user_input_apr.to_i > 0)
      break
    else 
      prompt(MESSAGES['input_apr_error'])
    end
  end

  prompt(MESSAGES['total_loan_duration'])

  loop do 
    user_input_loan_duration = gets.chomp
    if user_input_loan_duration.include?(',') 
      user_input_loan_duration = user_input_loan_duration.split(',') 
      
      i = 0
      loop do
        if (user_input_loan_duration[i].to_i.to_s == user_input_loan_duration[i]) && (user_input_loan_duration[i].to_i >= 0) && ((user_input_loan_duration[0].to_i + user_input_loan_duration[1].to_i) > 0)
          i += 1
          break if i > 1
        else
          prompt(MESSAGES['total_loan_duration_integer_error'])
          break
        end
      end
      next if i < 2 

    else 
      prompt(MESSAGES['total_loan_duration_comma_error'])
      next
    end
    break
  end



  # # M = monthly payment
  monthly_payment = nil
  # # P = loan amount
  loan_amount = user_input_loan_amount.to_i
  # # J = monthly interest rate
  monthly_interest_rate = ((user_input_apr.to_f/100)/12)
  # # N = loan duration in months
  monthly_loan_duration = duration_in_months(user_input_loan_duration)
  # m = p * (j / (1 - (1 + j)**(-n)))
  monthly_payment = (loan_amount) * ( monthly_interest_rate / (1 - ( 1 + monthly_interest_rate) ** ( -monthly_loan_duration)))

  prompt("Your monthly payment is $#{monthly_payment.round(2)}")
  prompt( "Your monthly interest rate is #{(monthly_interest_rate * 100).round(2)}%")
  prompt( "Your monthly loan duration is #{monthly_loan_duration} months")
  prompt( "Do you want to calculate another loan? (Y to calculate again or N to exit)")
  go_again = nil

  loop do
    go_again = gets.chomp
    if go_again.downcase == 'y'
      go_again = true
      break
    elsif go_again.downcase == 'n'
      go_again = false 
      break
    end
  end
  break if go_again == false
end

prompt(MESSAGES['goodbye'])