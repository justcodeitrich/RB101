#main idea: Write a method that converts a number to a string
#This time, if it is a negative number, the string includes a '-'
#if 0, no sign, if positive number, string includes '+'

# Input: Integer
# Output: String

# Solution from before

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

# How can I add the negative, positive signs?
# I can use String#prepend
# For negative numbers, I'll need to remove the '-' before passing the argument into integer_to_string
# I can't use Integer#digits on a negative number - throws Math::DomainError
# Maybe I can check whether or not the integer passed is a negative integer - this works 
# I can't use integer[1..-1] to isolate the numbers - its not the same as a string or array
# I multipled it by -1 to get the positive version and later add the '-' sign

def signed_integer_to_string(integer)
  if integer < 0 
    integer_to_string(integer*-1).prepend('-')
  elsif integer == 0
    '0'
  else
    integer_to_string(integer).prepend('+')
  end
end

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

#LS Solution

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

#Further Exploration
#Refactor to reduce the 3 integer_to_string calls to one

def signed_integer_to_string(number)
  return "-#{integer_to_string(-number)}" if number < 0
  number == 0 ? "0" : "+#{integer_to_string(number)}"
end
