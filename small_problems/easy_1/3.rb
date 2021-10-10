
# Method takes 1 argument - a positive integer
# Returns a list of digits in the number

# Take the number, split it into digits, and return it in an array 

# How to split number into digits and keep it in integer data type?
# use a method?
# Go through each digit of the integer as a string and convert into integer?

def digit_list(integer)
  list = []
  split_int = integer.to_s.split('')
  
  split_int.each do |x|
    int = x.to_i
    list.push(int)
  end
  list
end

digit_list(230) == [2,3,0] #=> true


# LS Idiomatic solution
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

def digit_list(number)
  number.tap{|x| p "original argument value #{x}"}
  .to_s.tap{|x| p "argument value to string#{x}"}
  .chars.tap{|x| p "string used with chars method #{x}"}
  .map(&:to_i).tap{|x| p "back to integer #{x}"}
end

def digit_list(number)
  digits = [] # - variable digits containing an empty array to store final output
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end