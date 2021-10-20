# main idea: Write a method that takes a string that has mixed words and non-alphabetic characters
# Return the string with all non-alphabetic characters replaced with spaces
# If there are consecutive non-alphabetic characters, they are to be replaced with one space

# input: 1 string
# output: 1 string

# Write a method that takes 1 argument
# I'll have to first identify the non-alphabetic characters - I can use regex for this
# Then I can substitute them with a space - #String#sub 
# ----- get here first -----
# How can I make multi-characters into 1 space? 
# Maybe I can replace multiple instances of spaces with a single space. Using *?
# return final string

# Problems
# the output for char.sub is putting a new line for each character so the array is vertical
# Why is this so? 
# => Output from ("---what's my +*& line?").chars.map {|x| "#{x}"} . Also each method prints vertically too
# ANSWER: Because the string is so long it doesn't fit into IRB. I don't think arrays would have new lines since every element is ended with a comma
# ["-",
# "-",
# "-",
# "w",
# "h",
# "a",
# "t",
# "'",
# "s",
# " ",
# "m",
# "y",
# " ",
# "+",
# "*",
# "&",
# " ",
# "l",
# "i",
# "n",
# "e",
# "?"]

# What this was doing is comparing two elements, deleting one, and then going to the next two indexes
# But because it deletes an index, it skips elements instead of comparing each pair in order

# until i > final_string.length
#   puts "#{final_string[i]} + #{final_string[i+1]}"
#   final_string.delete_at(i) if final_string[i] == ' ' && final_string[i+1] == ' '
#   i += 1
# end

# the problem I'm running into is how do I delete and iterate through all of the elements at the same time?
# because as I'm deleting, the i is moving forward, thus skipping elements to be compared
# maybe I can store the index numbers at which there are multiples and then delete them at once?

# index_numbers = [0, 1, 12, 13, 14, 15] - but I still need to delete them. Array#delete_at method deletes one at a time
# This means the indexes will move out of position as I delete them


def cleanup(string)
final_string = ''
index_numbers = []
i = 0
  final_string = string.chars.map do |char|
    char.sub(/\W/," ")
  end
  loop do
    final_string.delete_at(i) if final_string[i] == ' ' && final_string[i+1] == ' '
    i += 1 if (final_string[i] == ' ' && final_string[i+1] == ' ') == false
    break if i == final_string.length
  end
  final_string.join
end

cleanup("---what's my +*& line?") == ' what s my line '


#LS Solution
#the Array#last is what prevents from double spaces being added to clean_chars
#ex. If the previous element is a space, it will not add another space

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char) 
      p clean_chars << char # pushes included characters into array
    else
      p clean_chars << ' ' unless clean_chars.last == ' ' # pushes a space for non-alphabetic characters
    end
  end

  clean_chars.join
end