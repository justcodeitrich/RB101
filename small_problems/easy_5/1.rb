#main idea: Write a method that determines the ASCII string value of a string that is passed in

#input: a string
#output: an integer

# What is ASCII?
# It is a code that uses numbers to represent characters.
# Use String#ord to find the ASCII value of a character
# ASCII String value is the sum of all the ASCII values of every character in the string

# Write a method that has 1 parameter
# Create a variable to hold the final ASCII string value
# Split the string by characters
# Iterate through each character and convert it to ASCII value
# Add it to the final variable


def ascii_value(string)
  ascii_total = 0
  split_string = string.chars
  split_string.each do |char|
  ascii_total += char.ord
  end
  ascii_total
end

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

#Further exploration
#What method name should be used in place of mystery?

# if char is 'a'
# 'a'.ord is 97 
# how is 97 turned back into 'a'?
char.ord.mystery == char

#Integer#chr
char.ord.chr == char
'a'.ord.chr == 'a' #=> true
