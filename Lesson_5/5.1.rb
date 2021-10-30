# objective: order the array of strings by descending numeric value

# I can use sort to iterate through each element
# Each element must be converted from string to integer 

arr = ['10', '11', '9', '7', '8']

arr.sort! do |a,b|
  b.to_i <=> a.to_i
end

