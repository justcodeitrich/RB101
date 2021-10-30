# return a new array containing the same sub-arrays
# order the sub-arrays by only taking into consideration the odd numbers they contain

# input: array
# output: array

# iterate through each element, sort selected elements

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |array|
  array.select do |number|
    number.odd?
  end
end

# private method `select' called for 1:Integer (NoMethodError)
# what is a private method?

# why is it when I use sort the below solution throws an error?
# `sort': undefined method `>' for [1,7]:Array (NoMethodError)

arr.sort do |array|
  array.select do |number|
    number.odd?
  end
end