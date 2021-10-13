# Main idea: Write a program that asks user for a number and returns back to user
# either the sum or product of all the numbers from 1 to their chosen number

# input: - 1 integer greater than 0
#        - a choice of sum or product from user
# output: 1 integer

# Prompt user for a number
# store number in variable
# prompt user to choose between adding or multiply
# store decision
# if user chose add, add all numbers from 1 to their number.
# else if user chose multiply, multiply all the numbers from 1 to their number.
# store final output in a new variable

# questions:
# Can I make a dynamic range up to a user number? (ex. 1..user_variable) - yes
# How would I multiply or add the numbers together? 
# I could use Enumerable#reduce method or iterate through each element and add it to the storing variable

puts "Hi, give a number greater than 0."
user_number = gets.to_i
puts "Do you want the sum or product of all the numbers up to your chosen number? 
Type s for sum or p for product"
user_choice = gets.chomp.downcase
final_number = 0 
final_number = 1 if user_choice == 'p'
(1..user_number).each do |number|
  if user_choice == 's'
    final_number += number
  elsif user_choice == 'p'
    final_number *= number
  end
end

puts "Your calculated number is #{final_number}"

# Using Enumerable#reduce

puts "Hi, give a number greater than 0."
user_number = gets.to_i
puts "Do you want the sum or product of all the numbers up to your chosen number? 
Type s for sum or p for product"
user_choice = gets.chomp.downcase
final_number = 0 

if user_choice == 's'
  final_number = (1..user_number).reduce(:+)
elsif user_choice == 'p'
  final_number = (1..user_number).reduce(:*)
end

puts "Your calculated number is #{final_number}"