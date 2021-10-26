#problem 1
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  p numbers.shift(1)
end

# will return []

#answer => [3,4]
#problem 1 closer look
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end
# output:
# "0  [1, 2, 3, 4]  1"
# "1  [2, 3, 4]  3"


# problem 2
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

p 1
p 2
[1,2]