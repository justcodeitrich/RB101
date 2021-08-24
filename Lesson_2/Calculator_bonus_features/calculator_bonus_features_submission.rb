# Bonus feature 1 - lines 15 - 17
# Bonus feature 2 - lines 19 - 21
# Bonus feature 3 - line 34
# Bonus feature 4 - line 7 and related YAML files
# Bonus feature 5 - lines 8 - 9 and throughout code

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
SPANISH_MESSAGES = YAML.load_file('spanish_calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
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
    return LANGUAGE['adding']
  when '2'
    return LANGUAGE['subtracting']
  when '3'
    return LANGUAGE['multiplying']
  when '4'
    return LANGUAGE['dividing']
  end
  puts "Extra code placed here"
end

prompt(MESSAGES['language_select'])

language_preference = nil
loop do
  language_preference = Kernel.gets().chomp()
  break if language_preference == '1' || language_preference == '2'
  prompt("Please type 1 for English or type 2 for Spanish")
end

if language_preference == '1'
  LANGUAGE = MESSAGES
else
  LANGUAGE = SPANISH_MESSAGES
end

prompt(LANGUAGE['welcome'])

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(LANGUAGE['valid_name'])
  else
    break
  end
end

prompt(LANGUAGE['hi'] + " #{name}!")

loop do 
  number1 = nil
  number2 = nil

  loop do
    prompt(LANGUAGE['ask_first_number'])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(LANGUAGE['valid_number'])
    end
  end

  loop do
    prompt(LANGUAGE['ask_second_number'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(LANGUAGE['valid_number'])
    end
  end

  prompt(LANGUAGE['operator_prompt'])
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(LANGUAGE["operator_selection_error"])
    end
  end

  prompt(operation_to_message(operator).to_s)

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end
  prompt(LANGUAGE['result'] + " #{result}.")

  prompt(LANGUAGE['do_it_again?'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(LANGUAGE['goodbye_message'])
