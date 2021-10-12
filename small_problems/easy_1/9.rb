# Main idea: Create a method that takes one positive integer and returns the sum of its digits

# Input: Integer
# Output: Integer

# How to take a positive integer and add up all of its individual digits?
# Take integer and split by each number
# Create an inner variable to store the final number
# Iterate through each splitted number and add to the final number

# Is there a chars method for Integers? - No it's String#chars
# I can convert the number into a string, split it by chars, convert to integer to add into final output

def sum_of_digits(integer)
  total_sum = 0
  split_integer = integer.to_s.chars
  split_integer.each do |digit|
    total_sum += digit.to_i
  end
  total_sum
end

puts sum_of_digits(23) == 5
puts sum_of_digits(496) == 19
puts sum_of_digits(123_456_789) == 45

#Challenge - no looping

def sum_of_digits(integer)
  integer.to_s.chars.reduce(:+)
end

# LS Solution to Challenge
def sum(number)
  tap.(number).
  to_s.tap.
  chars.tap.
  map(&:to_i).tap.
  reduce(:+).tap
end

def sum(number)
  number.tap {|x| p x}
  .to_s.tap {|x| p x}
  .chars.tap {|x| p x}
  .map(&:to_i).tap {|x| p x}
  .reduce(:+).tap {|x| p x}
end