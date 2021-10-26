#main idea: Turn the array into hash where keys are names and values are positions in the array

#input: array
#output: hash

# Manual way
# create a hash 
# loop through the array, inserting each element as a key into the hash

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
counter = 0
loop do
  break if counter == flintstones.length
  flintstones_hash[flintstones[counter]] = counter + 1
  counter += 1
end

# With a built-in method - Enumerable#each_with_index

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash_2 = {}

flintstones.each_with_index do |name, index|
  flintstones_hash_2[name] = index + 1
end

flintstones_hash_2