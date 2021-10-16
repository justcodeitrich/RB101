# main idea: Write a method that takes a number and sums
# up all the multiples of 3 and 5 up till that given number

# input: 1 integer
# output: 1 integer

# write a method that takes 1 integer as an argument
# How can I select the multiples of 3 and 5? 
# I can use modulo - i % 3 == 0 and i % 5 == 0 
# I can iterate through a range from 1 to the given number
# and for each number that the modulo evaluation is true, to add 
# it to a final variable number

def multisum(integer)
  summed_number = 0
  (1..integer).each do |number|
    if number % 3 == 0 || number % 5 == 0
      summed_number += number
    end
  end
  summed_number
end

# Further Exploration using Enumerable#inject
# What is a memo?
# 

def multisum(integer)
  (1..integer).inject do |summed_number, number| 
    (summed_number + number) if number % 5 == 0 || number % 3 == 0
  end
end