# main idea: write a function named xor that takes two arguments and returns
# true if exactly one of the arguments is truthy, false otherwise (includes if both arguments are truthy)

# input: two arguments - any data type
# output: boolean true or false

# write a method that accepts two arguments
# evaluate each argument for truthy or falsy
# if either one is truthy, return true
# else return false

def xor?(arg1,arg2)
  if arg1 && arg2
    false
  elsif arg2 || arg1
    true
  elsif arg1 || arg2
    true
  else
    false
  end
end

p xor?(5.even?, 4.even?) # false, true - true
p xor?(5.odd?, 4.odd?)   # true, false - true
p xor?(5.odd?, 4.even?)  # true, true - false
p xor?(5.even?, 4.odd?)  # false, false - false

#LS Solution
def xor?(value1, value2)
  return true if value1 && !value2 #return true if value 1 is true and value2 is false
  return true if value2 && !value1 #return true if value 2 is true and value2 is false
  false # return false
end

def xor?(value1, value2)
  ( (value1 && !value2) || (value2 && !value1) )
end

#example
# xor?(5.even? => false, 4.even? => true)
# !!( (value1 && !value2) => false || (value2 && !value1) => true ) evaluates to true

# Further exploration
# the xor method does perform short circuit because of the || and && operands within it
# for xor operations short circuit isnt necessary 