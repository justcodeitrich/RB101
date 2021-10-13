# main idea: print all odd numbers inclusively from 1 to 99 (includes 1 and 99) to console
# Each number on separate line

# Input: Nothing
# Output: Integers from 1 to 99 on a new line 

# How to print odd numbers from 1 to 99?
# I could use a range and iterate through each number in the range with the odd? method
# if odd? is true then print it

# Can I call #each on a range? yes

(1..99).each do |number|
  puts number if number.odd? 
end

# Further exploration

#Integer#upto
1.upto(99) {|number| puts number if number.odd?}