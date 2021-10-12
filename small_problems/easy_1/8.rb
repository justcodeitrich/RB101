# Main point: Create a method that takes an array containing integers
# Method returns average of all numbers in the array
# Array is never empty and numbers are positive

# Input: Array of Integers
# Output: Single integer value

# Create an inner variable to hold the final average
# How can I take all the numbers in the array and average them?
# (Brute force) I can iterate through all the elements one by one, add them and then divide them by the total number integers in the array


def average(array)
  average_returned = 0
  array_total = 0
  array_integers = array.length

  array.each do |number|
    array_total += number
  end
  average_returned = (array_total / array_integers)
end

#LS Solution

def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

#FURTHER EXPLORATION - return a float instead of integer

def average(array)
  average_returned = 0
  array_total = 0
  array_integers = array.length

  array.each do |number|
    array_total += number
  end
  average_returned = (array_total.to_f / array_integers.to_f)
end