require 'yaml'
MESSAGES = YAML.load_file('prompts.yml')

def prompt(input)
  puts ">>> #{input}"
end

def duration_in_months(input)
  (input[0].to_i * 12) + (input[1].to_i)
end

def input_validate?(input)
  (input.to_i.to_s == input) && (input.to_i > 0)
end

def loan_duration_valid?(input, i)
  (input[i].to_i.to_s == input[i]) && (input[i].to_i >= 0) && ((input[0].to_i + input[1].to_i) > 0)
end

def get_loan_amount
  input = nil
  prompt(MESSAGES['input_total_loan'])
  loop do
    input = gets.chomp
    if input_validate?(input)
      break
    else
      prompt(MESSAGES['input_total_loan_error'])
    end
  end
  input.to_i
end

def get_apr
  input = nil
  prompt(MESSAGES['input_apr'])
  loop do
    input = gets.chomp
    if (input.include?('.')) && (input.to_i > 0)
      if input.to_f.to_s == input
        break
      else
        prompt(MESSAGES['input_apr_error'])
      end
    elsif input_validate?(input)
      break
    else
      prompt(MESSAGES['input_apr_error'])
    end
  end
  input
end

def get_loan_duration
  input = nil
  prompt(MESSAGES['total_loan_duration'])

  loop do
    input = gets.chomp
    if input.include?(',')
      input = input.split(',')
      count = 0
      loop do
        if loan_duration_valid?(input, count)
          count += 1
          break if count > 1
        else
          prompt(MESSAGES['total_loan_duration_integer_error'])
          break
        end
      end
      next if count < 2
    else
      prompt(MESSAGES['total_loan_duration_comma_error'])
      next
    end
    break
  end
  input
end

def get_monthly_payment(loan_amount, monthly_interest_rate, monthly_loan_duration)
  (loan_amount) * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-monthly_loan_duration)))
end

def results(monthly_payment, monthly_interest_rate, monthly_loan_duration)
  prompt("Your monthly payment is $#{monthly_payment.round(2)}")
  prompt("Your monthly interest rate is #{(monthly_interest_rate * 100).round(2)}%")
  prompt("Your monthly loan duration is #{monthly_loan_duration} months")
  prompt("Do you want to calculate another loan? (Y to calculate again or N to exit)")
end

def calculate_again?
  go_again = nil
  loop do
    go_again = gets.chomp
    if go_again.downcase == 'y'
      go_again = true
      break
    elsif go_again.downcase == 'n'
      go_again = false
      break
    else
      prompt(MESSAGES['calculate_again_error'])
    end
  end
  go_again
end

def clear_screen
  system('clear')
end

prompt(MESSAGES['welcome'])

user_input_loan_amount = nil
user_input_apr = nil
user_input_loan_duration = nil

loop do
  loan_amount = get_loan_amount
  clear_screen
  user_input_apr = get_apr
  clear_screen
  user_input_loan_duration = get_loan_duration
  clear_screen
  monthly_interest_rate = ((user_input_apr.to_f / 100) / 12)
  monthly_loan_duration = duration_in_months(user_input_loan_duration)
  monthly_payment = get_monthly_payment(loan_amount, monthly_interest_rate, monthly_loan_duration)
  results(monthly_payment, monthly_interest_rate, monthly_loan_duration)
  break if calculate_again? == false
  clear_screen
end

prompt(MESSAGES['goodbye'])
