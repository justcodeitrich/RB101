#main idea: write a method that takes an array and returns a list of 1st,3rd,5th,etc.
#values from the originally given array

#input: 1 argument in the form of an array
#output: 1 array returned

# How do I take the given array and return only the 1st,3rd,5th?
# Can I use even? with the index counter?

def oddities(array)
i = 0
final_array = []
  until i >= array.length
  final_array.push(array[i]) if i.even?
  i += 1  
  end
  final_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []