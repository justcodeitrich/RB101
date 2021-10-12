# Main task: Write a method that returns the string argument reversed
# Input - String
# Output - String reversed
# One argument

# How to reverse string? 
# Split up the string by words (spaces) into an array
# Create a new string to hold reversed words
# Remove the last element of the array one at a time and add it into the new string
# Output the final string

def reverse_words(string)
  reversed_string = ''
  string.strip! # removes whitespace for arguments containing only spaces
  return string if string.empty? #exit method if string is empty
  split_string = string.split(' ')
  until split_string.length < 2
  reversed_string << (split_string.pop + " ")
  end
  reversed_string << split_string.pop
  reversed_string
end

puts reverse_words('Hello World') == 'World Hello'
puts reverse_words('Reverse these words') == 'words these Reverse'
puts reverse_words('') == '' # This issue here is that I can't use concat method on nil (No implicit conversion of nil into string)
puts reverse_words('    ') == '' # How do I remove whitespace? String#strip

#LS Solution
def reverse_sentence(string)
  string.split.reverse.join(' ')
end

