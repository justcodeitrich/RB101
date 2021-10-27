# If map was called with a block that returned nil on every iteration, it would return an empty array. - FALSE
# It returns nil within an array

[1..10].map do |num|
  puts num
end

# => [nil]

a = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]

b = a.map do |num|
  num
end

# => [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]