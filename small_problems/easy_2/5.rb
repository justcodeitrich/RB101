# Write a program that takes the user's name and greets them
# If there is a ! like Dave! then yell back to the user

# Input: 1 string - the user's name
# Output: 1 string (2 different possible outputs for that 1 string)
# 1 - Greet the user normally with their name
# 2 - Yell at the user in all capitals

# Basic logic: If the user inputs includes a !, then give a response in all capital words

puts "Hi what is your name?"
name = gets.chomp
# How do I remove the ! at the end of the name when user inputs it?


if name.include?("!")
  name = name.delete!("!").upcase!
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
