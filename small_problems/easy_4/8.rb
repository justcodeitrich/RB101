# main idea: Write a method that converts string of digits to an integer
# if the string of digits leads with a + or no sign, the output is positive, if string of digits is -, the output is negative

# input: a string
# output: an integer

# LS SOLUTION from problem 7
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  '+' => '+', '-' => '-' 
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  digits.shift if digits[0] == '+'
  value = 0
  if digits[0] == '-'
    digits.shift
    digits.each { |digit| value = 10 * value + digit }
    return value * -1
  else 
    digits.each { |digit| value = 10 * value + digit }
  end
  value
end

# With the above string_to_integer method, a + or - sign returns an error
# How can I make it so that when a sign is passed in as an argument, it is processed separately?
# Maybe add a hash key/value pair for + or -, and unshift it from the digits
  # in IRB, a sign returns nil. i.e. ('-1234') => [nil,1,2,3,4]
  # I think that if I do '+' => +, the value is returned as nil, so instead I can keep it as a string. 

# Now that digits contains the sign, I can unshift it with Array#unshift 
# I only need to account for the (-) sign, positive sign I just need to remove 
# How can I make a number negative? multiply by -1, but at the end, not during the each iteration


string_to_integer('4321') == 4321
string_to_integer('-570') == -570
string_to_integer('+100') == 100


#LS Solution:
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

# Further exploration: Refactor string_to_signed_integer to call string_to_integer twice instead of three times
# is else required in this case statement? yes
# How can I include the scenario of no sign to result in a positive number

def string_to_signed_integer(string)
  if string[0] == '-'
    -string_to_integer(string[1..-1])
  elsif string[0] == '+'
    string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

#Final answer: for further exploration
def string_to_signed_integer(string)
  return -string_to_integer(string[1..-1]) if string[0] == '-'
  string[0] == '+' ? string_to_integer(string[1..-1]) :  string_to_integer(string)
end

# why do these lines work correctly if they are the only line in the method
# but if they are both in the method, a string of '-123' returns nil?
# Why is the method returning nil?
# 

string_to_signed_integer('-123')
# so the string_to_integer returns 123 when passed '-123'
# Why isn't this return value being returned to the larger method string_to_signed_integer?
# I think it's because the last line of a method is what is returned, so even though the string[0] == '-'
# was correctly run, what was returned to the method was the string[0] = '+'. I put a return keyword for the string[0] == '+'
# and it worked

