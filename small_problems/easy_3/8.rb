#main idea: Write a method that verifies that a string given is a palindrome

#input: a string 
#output: boolean 

# palindromes - words that if reversed look like the original word
# case, punctuation, and spaces matter for palindromes

# Write a method that takes 1 argument
# How would I check that it is equal going forward and backwards?
# Could I use String#reverse method and set it equal to itself?

def palindrome?(string)
  string.reverse == string ? true : false
end

#LS Solution
def palindrome?(string)
  string == string.reverse
end

#Further exploration
# Part 1 - Method that determines if an array is palindromic
# Part 2 - Method that determines if an array or string is palindromic
# Cannot use if, unless, case

#Part 1
def palindrome?(array)
  array == array.reverse
end

#Part 2 - it's the same thing because both string and array have the reverse method
# Doesnt matter if I pass array or string as an argument
def palindrome?(input)
  input == input.reverse
end

palindrome?([1,2,3,2,1]) # true
palindrome?('madam')  # true