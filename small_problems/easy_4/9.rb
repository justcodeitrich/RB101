# main idea: Write a method that takes an integer and converts it into a string

# input: 1 integer
# output: 1 string

# Cannot use Integer#to_s, String(), Kernel#format

# Write a method that takes 1 argument
# How can I convert a number into a string?
# I can use a hash like I did previously, except with keys as integers and values as strings
# What's the equivalent of using the String#chars method to split up the individual characters?
# How can I split up the numbers? Look up Integer and maybe Numeric or Enumerable?
# I can use Integer#digits to split up number into an array and iterate through them
# I'll need to use Array#reverse or Array#reverse_each because digits reorders the numbers backwards
# Then I can use String#<< or String#concat to add in the string equivalents from hash into a final variable

DIGITS = {
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
  0 => '0',
}

def integer_to_string(integer)
int_to_arr = integer.digits.reverse!
final_string = ''
  int_to_arr.each do |integer| 
    final_string.concat(DIGITS[integer])
  end
final_string
end

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

# LS Solution

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
