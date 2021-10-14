# Main idea: Write a program that takes 6 numbers from user and
# lets user know if the 6th number is present in the first 5

# input: 6 numbers from user
# output: a string 

# How to check if last number is included in the first 5?
# I could use include? on the numbers as strings
# How do I combine all the variables into an array?
# I could iterate all of them into an array

#Brute forcing

=begin
puts "Enter the 1st number:"
first_number = gets.chomp

puts "Enter the 2nd number:"
second_number = gets.chomp

puts "Enter the 3rd number:"
third_number = gets.chomp

puts "Enter the 4th number:"
fourth_number = gets.chomp

puts "Enter the 5th number:"
fifth_number = gets.chomp

puts "Enter the last number:"
last_number = gets.chomp

if first_number.include?(last_number)
  puts "The number #{last_number} appears in #{[first_number.to_i,second_number.to_i,third_number.to_i,fourth_number.to_i,fifth_number.to_i]}"
elsif second_number.include?(last_number)
  puts "The number #{last_number} appears in #{[first_number.to_i,second_number.to_i,third_number.to_i,fourth_number.to_i,fifth_number.to_i]}"
elsif third_number.include?(last_number)
  puts "The number #{last_number} appears in #{[first_number.to_i,second_number.to_i,third_number.to_i,fourth_number.to_i,fifth_number.to_i]}"
elsif fourth_number.include?(last_number)
  puts "The number #{last_number} appears in #{[first_number.to_i,second_number.to_i,third_number.to_i,fourth_number.to_i,fifth_number.to_i]}"
elsif fifth_number.include?(last_number)
  puts "The number #{last_number} appears in #{[first_number.to_i,second_number.to_i,third_number.to_i,fourth_number.to_i,fifth_number.to_i]}"
else 
  puts "The number #{last_number} does not appear in #{[first_number.to_i,second_number.to_i,third_number.to_i,fourth_number.to_i,fifth_number.to_i]}"
end

=end
# What if I combined all the user inputs into an array?

puts "Enter the 1st number:"
first_number = gets.to_i

puts "Enter the 2nd number:"
second_number = gets.to_i

puts "Enter the 3rd number:"
third_number = gets.to_i

puts "Enter the 4th number:"
fourth_number = gets.to_i

puts "Enter the 5th number:"
fifth_number = gets.to_i

puts "Enter the last number:"
last_number = gets.to_i

# Is this a reliable method of putting strings into an array? It almost seems too easy as if 
# there should be a method to combine these 5 variables together or a way to iterate using push
array_of_numbers = [first_number,second_number,third_number,fourth_number,fifth_number]

if array_of_numbers.include?(last_number)
  puts "The number #{last_number} appears in #{[first_number,second_number,third_number,fourth_number,fifth_number]}"
else
  puts "The number #{last_number} does not appear in #{[first_number,second_number,third_number,fourth_number,fifth_number]}"
end

#LS Solution
numbers = []

puts "Enter the 1st number:"
numbers << gets.chomp.to_i
puts "Enter the 2nd number:"
numbers << gets.chomp.to_i
puts "Enter the 3rd number:"
numbers << gets.chomp.to_i
puts "Enter the 4th number:"
numbers << gets.chomp.to_i
puts "Enter the 5th number:"
numbers << gets.chomp.to_i
puts "Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end