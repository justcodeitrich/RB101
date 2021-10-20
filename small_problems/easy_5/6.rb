# main idea: Write a method that takes a string with one or more words
# and returns a hash of occurrences of the word size

# input: string
# output: hash of integers - word size integer => number of occurrences

# Write a method that has one parameter
# Create a hash to store the final returned value
# Split the string passed into the method using String#split
# Iterate through each word, and count each word length
# Then take that word length and add it as a hash value into the final hash variable
# If the hash key already exists, how do I ensure it is added and not replacing the value?
# I could use an if/else statement to check if a value is already there
# return final variable

def word_sizes(string)
  word_count = {}
  split_string = string.split
  split_string.each do |word|
    if word_count[word.length] == nil
      word_count[word.length] = 1
    else
      word_count[word.length] += 1
    end
  end
  word_count
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

