#Main idea: Create a method that takes two arguments, multiplies them together
# and returns the result

# input: two integers
# output: one integer

def multiply(one,two)
  one * two
end

p multiply(4,5)

# Further exploration - first argument is an array
p multiply([1,2,3],5)
p multiply(5,[1,2,3]) # Typeerror - Array can't be coerced into Integer