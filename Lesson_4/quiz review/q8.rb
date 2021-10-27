
# Answer A: If select was called with a block that returned a falsey value on every iteration, select would return nil

a = [1,2,3,4,5]
a = {a:1,b:2,c:3}

a.select do |number|
  p number == 'a'
end

# => []
# => {}

# returns the original collection type when every iteration is false

# Answer C: If select was called on an array with a block that returned a truthy value on each iteration, the original array would be returned.

a = {a:1,b:2,c:3}

b = a.select do |number|
  number
end

a.object_id == b.object_id # => false
puts a.object_id
puts b.object_id