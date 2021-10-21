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
  final_string << word.chars.uniq.join
  end
final_string.join(' ')
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba' # crunch returns 4abc - so I can't use uniq 
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# Trying a different way without uniq that compares each character
# I'm getting lost in the nested loops
# Instead of making any changes, first print out each character
# a double nested each breaking down the word to letters doesnt let me compare letters to each other since its only one letter at time


# the below code deletes only the first double letter and leaves the rest
def crunch(string)
split_string = string.split(' ')
condensed_word = []
  split_string.each do |word|
    split_word = word.chars
    i = 0
    loop do
      loop do
      split_word.delete_at(0) if split_word[0] == split_word[1] 
      break if split_word[0] != split_word[1]
      end
      i += 1
      break if i >= split_word.length
    end
    condensed_word << split_word
  end
  condensed_word
end

crunch('ddaaiillyy ddoouubbllee')

# What if instead of using String#split into an array, I iterated as a string
# And compared using the String#<=>
# How do I delete a character in a string by its index? 
# I'll convert it to an array and iterate that way so I can use Array#delete_at
# chars converts string into array

def crunch(string)
condensed_word = ''
i = 0
str_to_arr = string.chars
  loop do 
    if (str_to_arr[i] <=> str_to_arr[i+1]) == 0
      str_to_arr.delete_at(i) 
    else 
      i +=1
    end
    break if i >= str_to_arr.length
  end
  str_to_arr.join()
end

crunch('ddaaiillyy ddoouubbllee')

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# LS Solution
# So the LS solution doesn't delete at all , it just adds the letters that aren't repeated

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end
