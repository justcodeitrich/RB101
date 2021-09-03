require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
SPANISH_MESSAGES = YAML.load_file('spanish_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num =~ /\D/
end

def number?(num)
  num.to_i.to_s == num || num.include?('.')
end

def operation_to_message(op)
  case op
  when '1'
    LANGUAGE['adding']
  when '2'
    LANGUAGE['subtracting']
  when '3'
    LANGUAGE['multiplying']
  when '4'
    LANGUAGE['dividing']
  end
end

def language_prompt(language_input)
  loop do
    language_input = gets.chomp
    break if language_input == '1' || language_input == '2'
    prompt("Please type 1 for English or type 2 for Spanish")
  end
  language_input
end

def user_name(name)
  loop do
    name = gets.chomp
    break unless name.empty?
    prompt(LANGUAGE['valid_name'])
  end
  name
end

def first_number(number)
  loop do
    prompt(LANGUAGE['ask_first_number'])
    number = gets.chomp
    break if number?(number)
    prompt(LANGUAGE['valid_number'])
  end
  number
end

def second_number(number)
  loop do
    prompt(LANGUAGE['ask_second_number'])
    number = gets.chomp
    break if number?(number)
    prompt(LANGUAGE['valid_number'])
  end
  number
end

def operation(operator)
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(LANGUAGE["operator_selection_error"])
  end
  operator
end

# convert numbers to floats or integers prior to passing them into calc
def to_f_or_i(num)
  if num.include?('.')
    num.to_f
  else
    num.to_i
  end
end

def calc(op, n1, n2)
  result =  case op
            when '1'
              n1 + n2
            when '2'
              n1 - n2
            when '3'
              n1 * n2
            when '4'
              if n1.to_f == 0.0 || n2.to_f == 0.0
                "undefined as a result of division by 0"
              else
                n1.to_f / n2.to_f
              end
            end
  result
end

def calculate_again?
  answer = ''
  go_again = nil
  loop do
    answer = gets.chomp
    if answer.downcase == 'y' || answer.downcase == 'yes'
      go_again = true
      break
    elsif answer.downcase == 'n' || answer.downcase == 'no'
      go_again = false
      break
    else
      prompt(LANGUAGE['again_error'])
    end
  end
  go_again
end

prompt(MESSAGES['language_select'])

language_preference = nil

language_selection = language_prompt(language_preference)

if language_selection == '1'
  LANGUAGE = MESSAGES
else
  LANGUAGE = SPANISH_MESSAGES
end

system('clear')

prompt(LANGUAGE['welcome'])

name = ''

name = user_name(name)

system('clear')
prompt(LANGUAGE['hi'] + " #{name}!")

loop do
  number1 = nil
  number2 = nil

  number1 = to_f_or_i(first_number(number1))
  number2 = to_f_or_i(second_number(number2))

  system('clear')

  prompt(LANGUAGE['operator_prompt'])
  operator = ''
  operator = operation(operator)

  system('clear')

  prompt(operation_to_message(operator).to_s)

  prompt(LANGUAGE['result'] + " #{calc(operator, number1, number2)}.")
  prompt(LANGUAGE['do_it_again?'])

  break unless calculate_again?
end

prompt(LANGUAGE['goodbye_message'])
