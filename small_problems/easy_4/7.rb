#main idea: create a method that converts a string of numbers into an integer

#input: 1 string of numbers
#output: 1 integer

# How do I convert strings into integers without using the String#to_i method?

# Write a method that has 1 parameter
# I can take the string, split it up by chars, and use a look up of a hash to push back into a final variable
# realized that I can't use << with an integer, using array instead and using join - nvm it returns a new string

# What's stumping me is how do I piece the individual integers together into one whole integer?
# I can't use << - it's not the shovel operator when used with an integer
# I can't use Array#join - it returns a new string
# Array#join - returns a new array
# can I find and replace? String#replace returns a string
# What about formatting? Kernel#format - this returns a string
# What if I don't need to split it by characters? Just flip the entire thing
# I'm thinking too hard
# String to Integer...
# Your method should do this the old-fashioned way and calculate the result 
# by analyzing the characters in the string.

# What I'm not understanding is how to convert string to an integer
# How can I combine my converted integers? 


NUMBER_LOOKUP = {
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '0' => 0
}

def str_to_int(string)
final_numbers = []
split_string = string.chars
split_string.each do |char|
  final_numbers << NUMBER_LOOKUP[char] 
end
final_numbers
end

#Got this from reddit 
def string_to_integer(string)
  eval(string)
end

string_to_integer('4321') == 4321
string_to_integer('570') == 570

def str_to_int(string)
  final_numbers = 0
  split_string = string.chars
  split_string.inject(0) do |final_numbers, element|
    final_numbers += NUMBER_LOOKUP[element] 
  end
  final_numbers
  end


#LS SOLUTION
  DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  p digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

string_to_integer('1234')