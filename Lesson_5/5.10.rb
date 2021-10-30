# use map method to return a new array identical in structure
# but the value of each integer incremented by 1

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.each_with_object({}) do |(key,value),hash|
    p hash[key] = value + 1
  end
end

# I'm hacking/slashing. What am I not understanding here? 
# How the each_with_object method works with hash inner variables 
# If this is the correct method to be using for this problem
# How to increment without changing the original data structure

# I figured it out by seeing the output of key, value, hash and then moving the three pieces around until I got the right output

# LS Solution 1
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# LS Solution 2
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]