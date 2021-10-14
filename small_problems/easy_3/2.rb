# Main idea: Program that takes two numbers from user and calculates
# addition, subtraction, product, quotient, remainder, and power

# Input: Two numbers from user
# Output: Six strings - each one representing the calculation of the two numbers
# with one of the 6 operations

# Take two numbers from user and perform 6 operations
# I could use string interpolation

puts "==> Enter the first number"
num1 = gets.to_i

puts "==> Enter the second number"
num2 = gets.to_i

puts  "==> #{num1} + #{num2} = #{num1+num2}"
puts  "==> #{num1} - #{num2} = #{num1-num2}"
puts  "==> #{num1} * #{num2} = #{num1*num2}"
puts  "==> #{num1} / #{num2} = #{num1/num2}"
puts  "==> #{num1} % #{num2} = #{num1%num2}"
puts  "==> #{num1} ** #{num2} = #{num1**num2}"