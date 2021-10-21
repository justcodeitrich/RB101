# main idea: Write a method that takes a short line of text and prints it within a box

# input: a string
# output: a string

# write a method with 1 parameter
# How do I create a box???
# It looks like the characters('-','+', and '|') are used
# String interpolation?
# How do I make this a dynamic box that stretches with the word?


def print_in_box(string)
string_length = (string.length + 2)

  puts "
  +#{'-'*string_length}+
  |#{' '*string_length}|
  |#{' '*string_length}|
  | #{string} |
  |#{' '*string_length}|
  |#{' '*string_length}|
  +#{'-'*string_length}+
  "
end

print_in_box('To boldly go where no one has gone before.')

# Further exploration
# Truncate the message if it will be too fit inside the terminal window

def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"
  if message.length > 76
    message[37]="\n"
  else
    message
  end
  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end


print_in_box('To boldly go where no one has gone before.''To boldly go where no one has gone before.')