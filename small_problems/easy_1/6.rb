# Main idea: Create a method that takes a string of one or more words
# and returns the words that are 5 or more characters reversed
# Output should only have spaces when more than one word is present

# Input: String
# Output: String with words reversed depending on character count

# How to differentiate between words to reverse and not?
# Take each string and split it
# Create a new inner variable to hold final output
# Iterate through each element and if the character length of the word is >=5, then reverse it and add to container
# If not, then add it to final container

def reverse_words(string)
  reversed_output = ''
  split_string = string.split
  split_string.each do |word|
    if word.length >= 5
      reversed_output << word.reverse! + ' '
    else
      reversed_output << word + ' '
    end
  end
  reversed_output.strip!
end

# I need to add spaces in between words if there is more than one word being outputted in the string

puts reverse_words('Professional')          
puts reverse_words('Walk around the block') 
puts reverse_words('Launch School')         

#LS Solution
def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end