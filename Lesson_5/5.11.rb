# return a new array identical in structure but containing only integers
# that are multiples of 3
# use select or reject

# Enumerable#select returns a new array


arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |element| 
  element.select do |number|
    number % 3 == 0
  end
end

#=> [[], [3], [9], [15]] - empty array 

# LS Solution using reject
arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end
# => [[], [3], [9], [15]]