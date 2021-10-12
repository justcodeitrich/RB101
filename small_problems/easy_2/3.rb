#Main idea: Create a program that calculates the tip I should pay

# Input: Two integers consecutively from the user, one is bill amount, second is tip amount as an integer
# Output: print two strings- first string displays calculated tip and second string total bill incl tip

puts "Hi, please give total bill amount"
bill_amount = gets.to_f
puts "How much tip do you want to pay?"
tip_amount = gets.to_f

calculated_tip = (bill_amount * (tip_amount/100))

puts "The tip is $#{calculated_tip}. 
The total amount to pay is #{(calculated_tip + bill_amount)}."

# Further exploration - instead of $30.0, print the usual $30.00