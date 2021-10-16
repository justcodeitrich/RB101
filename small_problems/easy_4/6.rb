# main idea: write a method that takes an array of numbers
# and returns an array with the same number of elements
# each element has the running total from the original array

# input: 1 array of integers
# output: 1 array

# write a method with 1 parameter
# How can I make it so that I can take the original given array and return a running total
# I can use one variable to store the sum of the first two elements and push that into another variable that holds the output array
# I can keep iterating through each element, adding it to the sum and then pushing that sum into the array

running_total([2,5,13])
def running_total(array)
  sum = 0
  final_array = []
  array.each do |number|
    sum += number
    final_array << sum
  end
  final_array
end


# LS Solution

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end