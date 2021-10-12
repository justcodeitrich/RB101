# Main idea: Create a program that tells me how many years 
# I have until retirement depending on the age I want to retire

# Input: Two integers from the users consecutively 
# 1 - user age
# 2 - the age that the user wants to retire by

# Output: Two integers 
# 1 - The years left until retirement
# 2 - The year that they will retire

require 'date'

puts "How old are you?"
age = gets.to_i 
puts "At what age do you want to retire?"
retire_target = gets.to_i 

years_til_retirement = (retire_target - age)
year_of_retirement = (Time.now.year + years_til_retirement)

puts "You will work for #{years_til_retirement} years until you retire in the year #{year_of_retirement}."