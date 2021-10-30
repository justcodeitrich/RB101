# objective: return a new array of the same structure but with the sub arrays ordered 
# in descending order

# input: nested array
# output: a NEW nested array

# Enumerable#map
# I'm sorting the whole sub-arrays, not the contained elements 
    # I misinterpretted the instructions. The inner elements were to be sorted into descending order

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.sort # -> comparison of Array with Array failed (ArgumentError) - Why?

arr.sort_by do |a,b|
  b <=> a
end
# even though sort_by here can sort by arrays, it gives a different output than the answer

# => [[2, 1, 3], ["blue", "black", "green"], ["b", "c", "a"]]

# LS Solution

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]