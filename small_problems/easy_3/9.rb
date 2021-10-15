# main idea: write a method that verifies if argument passed is a palindrome
# This time, it is case insensitive (capitalization doesnt matter)
# Also ignores non-alphanumeric numbers(ignores commas, apostrophes)

#input: 1 string
#output: boolean

# How do I make it not care about case?
# I could downcase the entire string
# How do I make it ignore non-alphanumeric characters?
# using regex? combined with a delete method?
# Even if I delete the , and ' of Madam, I'm Adam, it will not return true
# because the spaces need to be removed too
# can regex be used as an argument in a delete method?
# TypeError - no implicit conversion of Regexp into String
# Maybe with gsub? It works

def real_palindrome?(string)
  word = string.downcase.gsub(/\W/,'')
  word == word.reverse
end

real_palindrome?('Madam')
real_palindrome?("Madam, I'm Adam")


#LS solution
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end