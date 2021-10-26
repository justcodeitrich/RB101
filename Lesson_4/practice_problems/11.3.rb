# remove people with age 100 and greater 

# How do I remove a hash key/value pair?

#manual loop

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

counter = 0
ages_only = ages.values
keys_only = ages.keys

loop do
  break if counter > ages.length
  ages.delete(keys_only[counter]) if ages_values[counter] > 100
  counter += 1
end

# with each method 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages_only = ages.values
keys_only = ages.keys

ages.each do |name, age|
  ages.delete(name) if age > 100
end