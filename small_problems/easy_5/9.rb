# main idea: Write a method that takes a string and returns a new string
# that collapsed all consecutive duplicate characters into a single character

# Can't use String#squeeze or String#squeeze!
# input: string
# output: string

# write a method with 1 parameter
# Create a final return string
# split the string with String#split
# Iterate through each word and each character of each word
  # maybe Array#uniq can work?
# compare two characters, if they are the same delete the first character
# push each word into the final returned string


def crunch(string)
final_string = []
string.split(' ').each do |word|
  word.chars.uniq # <---------- Left off here
  end
final_string
end


crunch('hello world')

#Left off figuring out how to compare each character and delete duplicates
#Figuring out how to use Array#uniq in this