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

REFACTORING:
- YAML FILE
- METHOD REFACTORING
- RUBOCOP

=end

puts "Welcome to mortgage calculator!"

user_input_loan_amount = nil
user_input_apr = nil
user_input_loan_duration = nil


  puts "Please input your total loan amount excluding dollar signs ($) and commas (,)."
  loop do 
    user_input_loan_amount = gets.chomp
    if user_input_loan_amount.to_i.to_s == user_input_loan_amount
      break
    else 
      puts "Must be a valid number without symbols"
    end
  end

  puts "Please input your APR (Annual Percentage Rate). Example format - 8.875"
  loop do 
    user_input_apr = gets.chomp
    if user_input_apr.to_f.to_s == user_input_apr
      break
    else 
      puts "Must be a valid percentage"
    end
  end

  puts "Please input your total loan duration in years and months. 
  Example: If your loan duration is 10 years and 3 months, type in 10,3"

  loop do 
    user_input_loan_duration = gets.chomp
    if user_input_loan_duration
      user_input_loan_duration.split(',')
      break
    else 
      puts "Must be valid format of years, months"
    end
  end

def duration_in_months(input)
  input.split(',')
end

# # M = monthly payment
# monthly_payment = nil
# # P = loan amount
# loan_amount = user_input_loan_amount.to_i
# # J = monthly interest rate
# monthly_interest_rate = ((user_input_apr/12)*100)
# # N = loan duration in months
# monthly_loan_duration = nil

p duration_in_months(user_input_loan_duration)

#I left off creating a method to take user input of loan duration and splitting it into an array