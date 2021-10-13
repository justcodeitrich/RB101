# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# # array of strings
# array2 = []
# p array1.object_id
# p array2.object_id
# # empty array
# array1.each { |value| array2 << value }
# # for each element in array1, shovel it/push it into array2, mutating it
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# # if the element in array1 starts with a C or S, capitalize it, mutating the element

# p array2
# # This should print the elements of array1 before the mutations on line 7 - WRONG! Why?
# # array2 outputted Moe, Larry, CURLY, SHEMP, Hrpo, CHICO, Groucho, Zeppo

# array1.each {|x| puts x.object_id}
# puts "-----"
# array2.each {|x| puts x.object_id}

# so when the values are being passed into array2 and "filling in" the array
# those "filling in's are not new objects but are new references to existing objects"

# Further exploration
# This can be troublesome if I unintentionally change objects in one array and affect other arrays linked to the same objects
# How to avoid - make array2 contain the original string elements and array1 change without affecintg array2

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2