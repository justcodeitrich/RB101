#Main idea: Program asks user for a word or words and gives back number of characters
# except for spaces

#input: 1 string
#output: 1 string containing 1 integer

# ask for user words
# count number of characters in words only.
# How to count for number of characters?
# Can chars method be used and not count spaces? - 
# It includes spaces, but maybe I can remove the spaces from the resulting array using Array#delete

puts "Enter a word or words"
user_word = gets.chomp
character_count = user_word.chars
character_count.delete(" ")

puts "There are #{character_count.length} characters in \"#{user_word}\""