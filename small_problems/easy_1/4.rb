# Method purpose - to count number of times an element comes up in a given array
# Words in array are case-sensitive
# Expected input is an array
# Expected output is a hash

# Flow of method execution
# Method takes array, iterates through each element
# Identifies element as new or repeating
  # Can use include? within if/else statement
  # Create hash that stores the count
# If new, adds to hash with value of 1, if repeating, adds +1 to same element already existing in hash
# Stops at end of array

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def word_count(array)
  count_hash = {}
  array.each do |word|
    if count_hash.include?(word)
      count_hash[word] += 1
    else
      count_hash[word] = 1
    end
  end
  puts count_hash
end
word_count(vehicles)

#LS Solution

def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end


count_occurrences(vehicles)

#Further Exploration - case insensitive

def word_count(array)
  count_hash = {}
  array.each do |word|
    if count_hash.include?(word.capitalize!)
      count_hash[word] += 1
    else
      count_hash[word] = 1
    end
  end
  puts count_hash
end
word_count(vehicles)