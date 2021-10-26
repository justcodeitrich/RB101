# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []
--------------------------------------------------------------------------------
My "Understanding the Problem" exercise

# input: a string
# output: a string or array

# What object type am I returning? - test cases show an array
# Am I returning a new object or the original object?
# What is meant by substring? - Does that mean each word or as shown in test cases the letters within the word?

# Explicit requirements:
# - Palindrome words are case sensitive ('dad' is a palindrome but 'Dad' isn't)
# - 

# Implicit requirements:
# - an array of substrings are returned
# - substrings aren't limited to complete words but can be the letters within the words
# - if there are no palindromes, return an empty array
# - this method will not return the same object passed into it. It will return a new object

# Full Code
def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      p substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []