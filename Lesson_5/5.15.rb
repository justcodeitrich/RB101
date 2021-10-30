# return an array which contains only the hashes where all integers are even

# Enumerable#all method - returns true or false

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.map do |hash| 
  hash.select do |_,value|
    value.all? do |integer|
      integer.even?
    end
  end
end

#=> [{}, {:b=>[2, 4, 6], :d=>[4]}, {:e=>[8], :f=>[6, 10]}]

# misread instructions - I parsed an extra layer too deep - 
# {b: [2, 4, 6], c: [3, 6], d: [4]} is one whole hash so the 3 disqualifies the entire thing
# from being added to final returned value

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

# => [{:e=>[8], :f=>[6, 10]}]

