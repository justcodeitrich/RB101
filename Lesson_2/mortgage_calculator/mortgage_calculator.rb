require 'yaml'
MESSAGES = YAML.load_file('prompts.yml')

def prompt(input)
  puts ">>> #{input}"
end

def duration_in_months(input)
  (input[0].to_i * 12) + (input[1].to_i)
end

def valid_integer?(input)
  (input.to_i.to_s == input) && (input.to_f > 0.001)
end

def valid_float?(input)
  (input.to_f.to_s == input) && (input.to_f > 0.001)
end



def get_loan_amount
  input = nil
  prompt(MESSAGES['input_total_loan'])
  until valid_integer?(input)
    input = gets.chomp
    prompt(MESSAGES['input_total_loan_error'])
  end
  input.to_i
end

def get_apr
  input = nil
  prompt(MESSAGES['input_apr'])
  until valid_float?(input) || valid_integer?(input)
  input = gets.chomp  
  prompt(MESSAGES['input_apr_error'])
  end 
  input
end


def ask_for_loan_duration
  prompt(MESSAGES['total_loan_duration'])
end

def valid_input_with_comma?(input) # Test
  input.include?(',')
  input = input.split(',')
  loan_duration_input_check(input) > 1
end

def valid_input_no_comma?(input) # Test
    input = input.split
    loan_duration_input_check(input) > 0
end

def loan_duration_valid?(a, i)
  (a[i].to_i.to_s == a[i]) && (a[i].to_i >= 0) && ((a[0].to_i + a[1].to_i) > 0)
end

def loan_duration_input_check(input)
  inner_input = input
  counter = 0
  loop do
    if loan_duration_valid?(inner_input, counter)
      counter += 1
      break if counter > 1
    else
      break
    end
  end
  counter 
end

def get_loan_duration
  input = gets.chomp
  until valid_input_with_comma?(input) || valid_input_no_comma?(input)
    prompt(MESSAGES['total_loan_duration_integer_error'])
    input = gets.chomp
  end
  input = input.split(',') 
end

def get_mnth_pay(loan_amt, mnth_int_rate, mnth_loan_dura)
  (loan_amt) * (mnth_int_rate / (1 - (1 + mnth_int_rate)**(-mnth_loan_dura)))
end

def results(monthly_payment, mnth_int_rate, monthly_loan_duration)
  prompt("Your monthly payment is $#{monthly_payment.round(2)}")
  prompt("Your monthly interest rate is #{(mnth_int_rate * 100).round(2)}%")
  prompt("Your monthly loan duration is #{monthly_loan_duration} months")
  prompt(MESSAGES['again?'])
end

def calculate_again?
  go_again = nil
  loop do
    go_again = gets.chomp
    if go_again.downcase == 'y' || go_again.downcase == 'yes'
      go_again = true
      break
    elsif go_again.downcase == 'n' || go_again.downcase == 'no'
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

clear_screen
prompt(MESSAGES['welcome'])

user_input_apr = nil
user_input_loan_duration = nil

loop do
  loan_amount = get_loan_amount
  clear_screen
  user_input_apr = get_apr
  clear_screen
  ask_for_loan_duration
  user_input_loan_duration = get_loan_duration
  # clear_screen
  mnth_int_rate = ((user_input_apr.to_f / 100) / 12)
  mnth_loan_dura = duration_in_months(user_input_loan_duration)
  mnth_pay = get_mnth_pay(loan_amount, mnth_int_rate, mnth_loan_dura)
  results(mnth_pay, mnth_int_rate, mnth_loan_dura)
  break if calculate_again? == false
  clear_screen
end

prompt(MESSAGES['goodbye'])
