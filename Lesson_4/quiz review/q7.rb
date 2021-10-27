
# example of each method running less than the original element amount
a = [1,2,3,4,5,6,7,8,9,10]

a.each do |number|
  p number
  p a
  a.pop if number.even?
end

# 1
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 2
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 3
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

# 4
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

# 5
# [1, 2, 3, 4, 5, 6, 7, 8]

# 6
# [1, 2, 3, 4, 5, 6, 7, 8]

# 7
# [1, 2, 3, 4, 5, 6, 7]

# => [1, 2, 3, 4, 5, 6, 7]

